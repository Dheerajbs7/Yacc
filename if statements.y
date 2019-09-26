%{
#include<stdio.h>
#include<stdlib.h>
int count=0;
%}
%token IF RELOP S NUMBER ID NL
%%
stmt: if_stmt NL {printf("No. of nested if statements=%d\n",count);exit(0);}
;
if_stmt : IF'('cond')''{'if_stmt'}' {count++;}
          |S
;
cond: x RELOP x
;
x:ID | NUMBER
;
%%
int yyerror(char *msg)
{
printf("the statement is invalid\n");
exit(0);
}
int main()
{
printf("enter the statement\n");
yyparse();
}





%{
#include "y.tab.h"
%}
%%
"if" {return IF;}
[sS][0-9]* {return S;}
"<"|">"|"=="|"<="|">="|"!=" {return RELOP;}
[0-9]+ {return NUMBER;}
[a-z][a-zA-Z0-9_]* {return ID;}
\n {return NL;}
. {return yytext[0];}
%%
int yywrap()
{
return -1;
}
