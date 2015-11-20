%{
#include <stdio.h>
#include <math.h>
int f=0;
float result;
%}
%union {
     float fvalue;
     char *string;
};
%token <fvalue> number
%token <string> err
%type <fvalue> exp
%left '-' '+'
%left '*' '/'
%left NEG
%right '^'   
%%
input:    /* empty string */
          | input exp {result=$2;}
         | error {f=1;}
       ;
exp:     exp '+' exp             { $$ = $1 + $3;   }
           | exp '-' exp             { $$ = $1 - $3;    }
           | exp '*' exp             { $$ = $1 * $3;    }
           | exp '/' exp             { $$ = $1 / $3;    }
           | '-' exp  %prec NEG      { $$ = -$2;        }
           | exp '^' exp             { $$ = pow ($1, $3); }
           | '(' exp ')'             { $$ = $2;         }
       | number                  { $$ = $1;         }
     ;
%%
int main()
{
         printf("\nEnter an arithmetic expression:\n\n");
         yyparse();
         if(f==0)
            printf("Result %f\n",result);
         else
            printf("Invalid Expression\n");
         return 0;
}
int yywrap()
{
         return 1;
} 
int yyerror(char *mes) {
        return 0;
}
