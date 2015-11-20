%{
#include <stdio.h>
#include <ctype.h>
#include <string.h>
char result[50];
int f=0;
%}
%union{
  char str[50];
};
%token <str> id 
%token <str> no
%token <str> err
%type <str> exp
%left '-' '+'
%left '*' '/'
%%
input: /* empty string */
   | input exp {strcpy(result,$2);}
   | error {f=1;}
   ;
exp: exp '+' exp { sprintf($$,"+%s %s",$1,$3); }
   | exp '-' exp {sprintf($$,"-%s %s",$1,$3); }
   | exp '*' exp { sprintf($$,"*%s %s",$1,$3); }
   | exp '/' exp {sprintf($$,"/%s %s",$1,$3);}
   | id {strcpy($$,$1);} 
   | no {strcpy($$,$1);} 
   ;
%%
int main()
{
   printf("\nEnter an arithmetic expression:\n\n"); 
   yyparse();
   printf("\n");
   if(f==1)
     printf("Invalid Expression\n");
   else
     puts(result);
   return 0;
}
int yywrap()
{
   return 1;
} 
int yyerror(char *mes) {
   return 0;
}
