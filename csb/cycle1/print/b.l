//Tanmay Kumar Pandey
//exp 3.b
//12130083
digit1[0]
digit2[1]
%{
#include<stdio.h>
int count=0;
%}
%%
({digit1}|{digit2})*{digit1}{digit1}{digit1}({digit1}|{digit2})* count=1;
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




