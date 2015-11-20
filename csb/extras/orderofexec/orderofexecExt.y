%{
#include <stdio.h>
#include <ctype.h>
#define YYSTYPE char
void push(char);
void attach(char);
int f=0;
struct node{
      char str[30];
};
struct node stack[20];
int stkPtr=-1;
%}
%token id err
%left '-' '+'
%left '*' '/'
%%
input: /* empty string */
      | input exp {}
      | error {f=1;}
   ;
exp: exp '+' exp { attach('+'); }
      | exp '-' exp { attach('-'); }
      | exp '*' exp { attach('*');}
      | exp '/' exp {attach('/');}
      | id { push($1); } 
   ;
%%
void push(char c){
struct node newNode;
      newNode.str[0]=c;
      newNode.str[1]='\0';
      stack[++stkPtr]=newNode;
}
void attach(char op){
      struct node newNode;
      struct node temp1=stack[stkPtr--];
      struct node temp2=stack[stkPtr--];
      sprintf(newNode.str,"(%s %c %s)",temp2.str,op,temp1.str);
     stack[++stkPtr]=newNode;
}
int main()
{
     printf("\nEnter an arithmetic expression:\n\n"); 
      yyparse();
      printf("\n");
      if(f==0)
           printf("%s\n",stack[stkPtr].str);
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
