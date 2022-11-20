%{
    #include <stdio.h>
    #include <stdlib.h>
    
    int yylex();
    int yyparse();
    void yyerror(const char*);
    
    /* #define YYSTYPE <type> */
%}

%token T_VAR 
%token T_CON 
%token T_BEG 
%token T_END 
%token T_IF 
%token T_THE 
%token T_WHI
%token T_DO 
%token T_PRI
%token T_EQU
%token T_DIF
%token T_GT
%token T_GTE
%token T_ST
%token T_STE
%token T_ATR
%token T_SUM
%token T_SUB
%token T_MUT
%token T_DIV
%token T_OPE
%token T_CLO
%token T_SCO
%token T_COL
%token T_DOT
%token T_NUM
%token T_IDE

%%

program:
    block T_DOT {}
;

block:
    const var statement {}
  | const statement     {}
  | var statement       {}
  | statement           {}
;

const:
    T_CON T_IDE T_EQU T_NUM T_SCO                   {printf("%d", $1);}
  | T_CON T_IDE T_EQU T_NUM const_identifier T_SCO  {}
;

const_identifier:
    T_COL T_IDE T_EQU T_NUM                     {}
  | const_identifier T_COL T_IDE T_EQU T_NUM    {}
;

var:
    T_VAR T_IDE T_SCO                   {}
  | T_VAR T_IDE var_identifier T_SCO    {}
;

var_identifier:
    T_COL T_IDE                     {}
  | var_identifier T_COL T_IDE      {}
;

statement:
    T_IDE T_ATR expression          {}
  | T_BEG statement T_END           {}
  | T_SCO statement                 {}
  | T_IF condition T_THE statement  {}
  | T_WHI condition T_DO statement  {}
  | T_PRI expression              {}
;

condition:
    expression T_EQU expression {}
  | expression T_DIF expression {}
  | expression T_GT expression  {}
  | expression T_GTE expression {}
  | expression T_ST expression  {}
  | expression T_STE expression {}
;

expression:
    term                    {}
  | term T_SUM expression   {}
  | term T_SUB expression   {}
;

term:
    factor              {}
  | factor T_MUT term   {}
  | factor T_DIV term   {}
;

factor:
    final       {}
  | T_SUB final {}  
;

final:
    T_IDE                   {}
  | T_NUM                   {}
  | T_OPE expression T_CLO  {}
;

%%


void yyerror(const char* s)
{
    printf("%s\n", s);
}

int main(int argc, char *argv[])
{
    return yyparse();
}