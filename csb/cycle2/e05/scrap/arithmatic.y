%{
#include <stdio.h>
int f=0;
%}
%token number identifier err
%%
input:    /* empty string */
       | input e
       |error {f=1;}
       ;
e:      number
          |identifier
           | e '+' e             
           | e '-' e            
           | e '*' e             
           | e '/' e             
           | '-' e  
           | e '^' e   
           | '(' e ')' 
     ;
%%
int main()
{
         printf("\nKey in arithmatic expression:\n\n");
         yyparse();
         if(f==0)
            printf("Valid Expression \n");
         else
            printf("Invalid Expression\n");
         return 0;
}
int yywrap()
{
           return 1;
} 
int yyerror(char *mes) {printf("%s\n", mes);}
