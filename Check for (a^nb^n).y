%{
#include<stdio.h>
int valid=1;
%}
%token A B
%%
str:S'\n' {return 0;}
S:A S B
 |
 ;
%%
int main()
{
   printf("Enter the string:\n");
   yyparse();
   if(valid==1)
   printf("\nvalid string");
}
int yyerror(char *msg)
{
printf("Invalid expression\n");
valid=0;
return 0;
}
