%{
#include<stdio.h>
#include<stdlib.h>
%}

%token NUM
%left '+''-'
%left '*''/'

%%
s:e {printf("\n result=%d\n",$1);return 0;}
e:e'+'e                 {$$=$1+$3;}
|e'-'e                  {$$=$1-$3;}
|e'*'e                  {$$=$1*$3;}
|e'/'e                  {$$=$1/$3;}
|'('e')'                {$$=$2;}
|NUM                    {$$=$1;}
;
%%
int main()
{
printf("\n Enter thr expression\n");
yyparse();
printf("\n valid expression");
return 0;
}
int yyerror()
{
printf("Invalid expression");
return 0;
}
