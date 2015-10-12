%{
   #include <stdio.h>
   #include "y.tab.h"
   %}
   number        [0-9]+
   flot         [0-9]*"."[0-9]+
   op        "+"|"-"|"*"|"/"|"("|")"|"^"|"%"
   %%
   {number} {    yylval.fvalue=atof(yytext); return number;    }
   {flot} {    yylval.fvalue=atof(yytext); return number;    }
   {op}    {    return (int) yytext[0];    }
   \n      { return(0); }
   .    { return err; }
   %%

