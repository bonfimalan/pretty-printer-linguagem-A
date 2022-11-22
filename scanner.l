%{
    #include "syntax.tab.h"
    #include <stdlib.h>

    extern char* identifier;
%}

digit ([0-9])
num ("-"?({digit})+)
letter ([a-z])
ide (({letter})({letter}|{digit})*)

%%
"IF"     {return T_IF;}
"THEN"   {return T_THE;}
"VAR"    {return T_VAR;}
"CONST"  {return T_CON;}
"BEGIN"  {return T_BEG;}
"END"    {return T_END;}
"WHILE"  {return T_WHI;}
"DO"     {return T_DO;}
"PRINT"  {return T_PRI;}
"="      {return T_EQU;}
"#"      {return T_DIF;}
">"      {return T_GT;}
">="     {return T_GTE;}
"<"      {return T_ST;}
"<="     {return T_STE;}
":="     {return T_ATR;}
"+"      {return T_SUM;}
"-"      {return T_SUB;}
"*"      {return T_MUT;}
"/"      {return T_DIV;}
"("      {return T_OPE;}
")"      {return T_CLO;}
";"      {return T_SCO;}
","      {return T_COL;}
"."      {return T_DOT;}
{num}    {return T_NUM;}
{ide}    {
    int cont = 0;
    // percorre até encontrar o fim do identificador, que será sempre precedido por um desses cinco caracteres
    while(yytext[cont] != '=' && yytext[cont] != ':' && yytext[cont] != ';' && yytext[cont] != ',' && yytext[cont] != ' ') {
        cont++;
    }
    // aloca dinâmicamente um espaço com o memso tamanho que o identificador
    char* pointer = (char*) calloc(cont, sizeof(char));
    // copia o valor do identificador para a variavel criada anteriormente
    for(int i=0; i<cont; i++) {
        pointer[i] = yytext[i];
    }
    // atribue o valor do identificador para a variavel externa
    identifier = pointer; 
    return T_IDE;
}
["\n"" ""\t"]   {;}
%%