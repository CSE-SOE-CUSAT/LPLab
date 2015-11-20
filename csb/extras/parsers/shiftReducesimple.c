#include <stdio.h>
#include <stdlib.h> 
#include <string.h>
char str[100],stack[100];
int stkPtr=-1;
void push(char);
char pop();
char peek();
void error();
int main(){
   int i,len,k;
   printf("Enter the expression:- ");
   gets(str);
   push('$');
   len=strlen(str);
   str[len]='$';
   str[len+1]='\0';
   for(i=0;i<len;i++){
    	if(str[i]>='0' && str[i]<='9'){
      	while(str[i+1]>='0'&&str[i+1]<='9')
        	i++;
      	push('E');
    	}
    	else if(str[i]=='+' || str[i]=='-' || str[i]=='/' || str[i]=='*')
      	push(str[i]);
    	else
      	error();
   }
   while(stkPtr>=3){
    	if(stack[stkPtr]=='E' && (stack[stkPtr-1]=='+' || stack[stkPtr-1]=='-' || stack[stkPtr-1]=='*' || stack[stkPtr-1]=='/') && stack[stkPtr-2]=='E'){
    	pop();
    	pop();
  	}
  	else
    	error();
   }
   if(stack[stkPtr]=='E' && stack[stkPtr-1]=='$')
    	printf("SUCCESS\n");
   else
    	error();
   return 0;
}
void push(char a){
   stack[++stkPtr]=a;
}
char pop(){
   return stack[stkPtr--];
}
char peek(){
   return stack[stkPtr];
}
void error(){
   printf("ERROR\n");
   exit(1);
}
