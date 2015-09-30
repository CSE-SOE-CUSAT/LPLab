%{
#include <stdio.h>
#include "y.tab.h"
%}
number        [0-9]+
float         [0-9]*"."[0-9]+
identifier    [a-zA-Z][a-zA-Z0-9]*
error     [0-9][a-zA-Z0-9]*
%%
{number} {    return number;    }
{float} {    return number;    }
{identifier} {    return identifier;    }
{error} {    return err; }
[ \t]+
\n  {    return(0); }
.    {    return (int) yytext[0];}
%%
