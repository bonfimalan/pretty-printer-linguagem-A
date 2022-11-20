
%{
    #include <stdio.h>
    #include "syntax.tab.h"
    void error();
%}

digit [0-9]
num "-"?(digit)+
letter [a-zA-Z]
ide (letter)(letter|digit)*

%%
    "VAR"   {return T_VAR;}
    "CONST" {return T_CON;}
    "BEGIN" {return T_BEG;}
    "END"   {return T_END;}
    "IF"    {return T_IF;}
    "THEN"  {return T_THE;}
    "WHILE" {return T_WHI;}
    "DO"    {return T_DO;}
    "PRINT" {return T_PRI;}
    "="     {return T_EQU;}
    "#"     {return T_DIF;}
    ">"     {return T_GT;}
    ">="    {return T_GTE;}
    "<"     {return T_ST;}
    "<="    {return T_STE;}
    ":="    {return T_ATR;}
    "+"     {return T_SUM;}
    "-"     {return T_SUB;}
    "*"     {return T_MUT;}
    "/"     {return T_DIV;}
    "("     {return T_OPE;}
    ")"     {return T_CLO;}
    ";"     {return T_SCO;}
    ","     {return T_COL;}
    "."     {return T_DOT;}
    {num}   {return T_NUM;}
    {ide}   {return T_IDE;}
    ["\n"" ""\t"]   {}
    .       {error();}
%%

void error() {
    printf("NOT A TOKEN!!!");
    exit(0);
}
