com1 "//"[a-zA-Z0-9 ]*
com2 "/*"[a-zA-Z0-9 ]*"*/"
keyword "int"|"while"|"for"|"float"|"return"|"main"|"if"|"else"|"printf"|"break"|"double"|"long"|"char"|"include"|"scanf"|"switch"|"go"
id [a-zA-Z][a-zA-Z0-9]*
digit [0-9]+
opr "+"|"-"|"*"|"/"|"="|"=="|"!="|">"|"<"|">="|"<="|"%"
%{
#include<stdio.h>
#include<string.h>
int count =0;
char output[500];
%}
%%
{com1} {count++;}
{com2} {count++;}
{keyword} {sprintf(output,"%s %s",output,yytext);}
{id} {sprintf(output,"%s %s",output,yytext);}
{digit} {sprintf(output,"%s %s",output,yytext);}
{opr} {sprintf(output,"%s %s",output,yytext);}
[\n {(:;,]+ {sprintf(output,"%s %s",output,yytext);}
[\t)}]+ {sprintf(output,"%s %s",output,yytext);}
%%
int yywrap(void){
return 1;
}
int main(int argc, char *argv[])
{
int fp;
yyin=fopen(argv[1],"r");
yylex();
printf("Number of comments: %d",count);
fp = fopen("outputfile","w");
fprintf(fp,output);
fclose(fp);
fclose(yyin);
return 0;
}
