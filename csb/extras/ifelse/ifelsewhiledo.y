%{
#include <stdio.h>
void callParser();
int if_count=0;
int while_count=0;
int do_count=0;
%}
%token DIGIT ID IF ELSE WHILE DO OPERATOR ERR
%left IF ELSE WHILE DO
%%
COMMANDS: /* empty */
           |COMMANDS WHILE_STMT { while_count++; }
           |COMMANDS IF_STMT { if_count++; }
           |COMMANDS DO_STMT { do_count++; }
       |error 
;
WHILE_STMT: WHILE COND ';' 
       | WHILE COND '{' STMTS '}' 
       | WHILE COND COMMANDS
;
IF_STMT: IF COND ';'
       | IF COND COND ';'
       | IF COND '{' STMTS '}'  
       | IF COND COND ';' ELSE COND ';'
       | IF COND COND ';' ELSE '{' STMTS '}'
       | IF COND '{' STMTS '}' ELSE COND ';'
       | IF COND '{' STMTS '}' ELSE '{' STMTS '}'
       | IF COND COMMANDS ELSE COND ';'
       | IF COND COMMANDS ELSE '{' STMTS '}'
       | IF COND COND ';' ELSE COMMANDS
       | IF COND '{' STMTS '}' ELSE COMMANDS
;
DO_STMT: DO COND ';' WHILE COND ';'
       | DO '{' STMTS '}' WHILE COND ';'
       | DO COMMANDS WHILE COND ';'
;
STMTS: STMTS COND ';'
       | COND ';'
       | STMTS COMMANDS
       |
;
COND: COND OPERATOR COND 
       | OPERATOR COND
       | COND OPERATOR
       | ID
       | DIGIT 
       | '(' COND ')'
;
%%
void callParser(){
         yyparse();
         printf("No of while statments %d\n",while_count);
         printf("No of if statments %d\n",if_count);
         printf("No of do while statments %d\n",do_count);
}
int yywrap()
{
         return 1;
} 
int yyerror(char *mes) {
        return 0;
}
