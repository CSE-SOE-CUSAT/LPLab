%{
#include "y.tab.h"
%}
DIGIT   [0-9]+
ID     [a-zA-Z][a-zA-Z0-9]*
OP    "+"|"-"|"*"|"/"|"%"|"=="|">"|"<"|">="|"="|"<="|"--"|"++"|"!="
OTHR     ";"|"+"|"("|")"|"{"|"}"
ERR     [0-9][a-zA-Z0-9]*
%%
"if"     { return IF; }
"while" { return WHILE; }
"do"    { return DO; }
"else"    { return ELSE; }
{DIGIT} { return DIGIT; }
{ID}    { return ID; }
{ERR}    { return ERR; }
{OP}    { return OPERATOR; }
{OTHR}  { return (int) yytext[0]; }
\n
.
%%
int main()
{
         char inp[20];
         printf("Enter the input file name:-  ");
         scanf("%s",inp);
         yyin=fopen(inp,"r");
         callParser();
         fclose(yyin);
         return 0;
}
