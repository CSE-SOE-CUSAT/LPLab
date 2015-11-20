%{
#include <stdio.h>
#include <string.h>
#include "y.tab.h"
%}
DIGIT [0-9]+
ID [a-zA-Z][a-zA-Z0-9]*
op "+"|"-"|"*"|"/"
%%
{ID} { strcpy(yylval.str,yytext); return id; }
{DIGIT} { strcpy(yylval.str,yytext); return no; }
{op} { return (int) yytext[0]; }
\n { return(0); } 
. { return err; } 
%%
