%{
#include<stdio.h>
int flag=0;
%}
%token num identifier err
%%
input : /*Empty*/
      |input e
      |error {flag=1;}
      ;
e:	num
 	|identifier
	|e '+' e
	|e '-' e
	|e '*' e
	|e '/' e
	|'-'e
	|e '^' e
	|'(' e ')';
%%
int main(){
	printf("Arithmetic expression?\n");
	yyparse();
	if(flag==0)
		printf("Valid expression\n");
	else
		printf("Invalid expression\n");
return 0;
}
int yywrap()
{
           return 1;
}
int yyerror(char *message) {printf("%s\n", message);}

