keyword "int"|"while"|"for"|"float"|"return"|"main"|"if"|"else"|"printf"|"break"|"double"|"long"|"char"|"include"|"scanf"|"switch"|"go"
id [a-zA-Z][a-zA-Z0-9]*
digit [0-9]+
float [0-9]+"."[0-9]+
operator "+"|"-"|"*"|"/"|"="|"=="|"!="|">"|"<"|">="|"<="|"%"
err [0-9][a-zA-Z0-9]*
%{
#include<stdio.h>
char doutput[100];
char foutput[100];
char koutput[100];
char idoutput[100];
char opoutput[100];
char invoutput[100];
char loutput[100];
%}
%%
{digit} { sprintf(doutput,"%s %s ",doutput,yytext); }
{float} { sprintf(foutput,"%s %s ",foutput,yytext); }
{keyword} { sprintf(koutput,"%s %s ",koutput,yytext); }
{id} {if(strstr(idoutput,yytext)){}else sprintf(idoutput,"%s %s ",idoutput,yytext); }
{operator} { sprintf(opoutput,"%s %s ",opoutput,yytext); }
{err} { sprintf(invoutput,"%s %s ",invoutput,yytext); }
[ \t\n{}();:,]+ { sprintf(loutput,"%s %s ",loutput,yytext); }
%%

int yywrap(void)
{
 return 1;
}
int main(int argc,char *argv[]) {
 char inp[20];
    if(argc==1){
	printf("No file provided\n");
	return;
	}
	else{
    yyin=fopen(argv[1],"r");
    yylex();
    if(strlen(doutput))            
    printf("Integers are %s\n",doutput);
    if(strlen(foutput))
    printf("Floats are %s\n",foutput);
    if(strlen(koutput))
    printf("Keywords are %s\n",koutput);
    if(strlen(idoutput))
    printf("Identifiers are %s\n",idoutput);
    if(strlen(opoutput))
    printf("Operators are %s\n",opoutput);
    if(strlen(invoutput))
    printf("Invalid identifiers are %s\n",invoutput);
    if(strlen(loutput))
    printf("Lexemes are %s\n",loutput);
    
}
return;
}

