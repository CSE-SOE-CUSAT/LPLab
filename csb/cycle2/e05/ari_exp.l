%{
#include<stdio.h>
#include "y.tab.h"
%}

num [0-9]*
float [0-9]*"."[0-9]+
identifier [a-zA-Z][a-zA-Z0-9]*
err [0-9][a-zA-Z0-9]*
%%

{num} { return num;}
{float} { return num; }
{identifier} {return identifier;}
{err} {return identifier; }
[ \t]+
\n {return 0; }
. { return (int) yytext[0]; }
%%

