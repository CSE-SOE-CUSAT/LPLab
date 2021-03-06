keyword "int"|"while"|"for"|"float"|"return"|"main"|"if"|"else"|"printf"|"break"|"double"|"long"|"char"|"include"|"scanf"|"switch"|"go"
id [a-zA-Z][a-zA-Z0-9]*
digit [0-9]+
float [0-9]+"."[0-9]+
operator "+"|"-"|"*"|"/"|"="|"=="|"!="|">"|"<"|">="|"<="|"%"
err [0-9][a-zA-Z0-9]*
%{
#include<stdio.h>
#include<string.h>
char doutput[100];
char foutput[100];
char koutput[100];
char idoutput[100];
char opoutput[100];
char invoutput[100];
char loutput[100];
int count1=0;
int count2=0;
int count3=0;
int count4=0 ;
int count5=0;
int count6=0;
int count7=0;
char* token;
char* st;
int flag=0;
char delim[]=" ";
%}
%%
{digit} { sprintf(doutput,"%s %s ",doutput,yytext);count1++; }
{float} { sprintf(foutput,"%s %s ",foutput,yytext);count2++; }
{keyword} { sprintf(koutput,"%s %s ",koutput,yytext);count3++; }
{id} {st=idoutput;
        while(1){token=strtok(st,delim);
			st=NULL;
		    if(token==NULL)break;
		printf(token);
	       	if(strcmp(token,yytext)==0)
			{
                flag=1;break;}
			}
            if(flag==1){}
			else{ sprintf(idoutput,"%s %s ",idoutput,yytext);count4++;} }
{operator} { sprintf(opoutput,"%s %s ",opoutput,yytext);count5++; }
{err} { sprintf(invoutput,"%s %s ",invoutput,yytext);count6++; }
[\n{(;:,]+ { sprintf(loutput,"%s %s ",loutput,yytext);count7++; }
[\t})]+ { sprintf(loutput,"%s %s ",loutput,yytext);count7++; }
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
    if(strlen(doutput)) {
    printf("\nNumbers are: %s\n",doutput);
    printf("Number of numbers: %d\n",(int)count1);}
    if(strlen(foutput)){
    printf("\nFloats are: %s\n",foutput);
	printf("Number of floats: %d\n",count2);}
    if(strlen(koutput)){
    printf("\nKeywords are: %s\n",koutput);
	printf("Number of keywords: %d\n",(int)count3);}
    if(strlen(idoutput)){
    printf("\nIdentifiers are: %s\n",idoutput);
	printf("Number of Identifiers:%d\n",count4);}
    if(strlen(opoutput)){
    printf("\nOperators are: %s\n",opoutput);
	printf("Number of operators:%d\n",count5);}
   if(strlen(invoutput)){
    printf("\nInvalid identifiers are: %s\n",invoutput);
	printf("Number of invalid identifiers:%d\n",count6);}
    if(strlen(loutput)){
    printf("\nLexemes are: %s\n",loutput);
	printf("Number of lexemes:%d\n",count7);}    
}
return;
}

