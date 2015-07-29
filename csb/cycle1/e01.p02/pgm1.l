digit [0-9]
letter1 [a]
letter2 [b]
%{
char r='n';
%}
%%
({letter1}|{letter2})*{letter1}{letter2}{letter2} r='y'; 
%%
int yywrap(void) {
return 1;
}
int main(int argc, char *argv[]) {
yyin = fopen(argv[1], "r");
yylex();
printf("%c\n", r);
fclose(yyin);
return 0;
}
