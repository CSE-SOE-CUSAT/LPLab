letter1[a]
letter2[b]
%{
#include<stdio.h>
int count=0;
%}
%%
{letter1}{letter1}({letter1}|{letter2})*{letter2}{letter2} count=1;
%%
int yywrap(void)
{
 return 1;
}
int main(int argc,char *argv[]) {
yyin = fopen(argv[1], "r");
yylex();
if(count==1)
printf("Valid String\n");
else
printf("Invalid String\n");
return 0;
fclose(yyin);
}



