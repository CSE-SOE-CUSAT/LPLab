#include<stdio.h>
#include<string.h>
#include <stdlib.h> 
char table[4][4]={'0','>','>','>',
      	'<','>','<','>',
      	'<','>','>','>',
      	'<','<','<','0'};
char tab_ordr[4]={'i','+','*','$'};
char stack[100];
int stkPtr=-1;
void push(char);
char pop();
char peek();
void error();
int preced(char,char);
int main(){
  	char str[20],temp,t[10];
  	int len,inp_ptr=0,prec,countOfI=0;
  	printf("Enter the expression:- ");
  	scanf("%s",str);
  	push('$');
   len=strlen(str);
   str[len]='$';
   str[len+1]='\0';
  	while(str[inp_ptr]!='$' || peek()!='$')
  	{
    	if(str[inp_ptr]>='0'&&str[inp_ptr]<='9'){
      	while(str[inp_ptr]>='0' && str[inp_ptr]<='9')
        	inp_ptr++;
      	str[--inp_ptr]='i';
  	}
  	prec=preced(peek(),str[inp_ptr]);
  	if(prec==0){
    	if(str[inp_ptr]=='i')
      	countOfI++;
    	else
      	countOfI--;
    	push(str[inp_ptr++]);
  	}
  	else if(prec==1){
    	do{
      	temp=pop();
    	}while(preced(peek(),temp)!=0);
  	}
  	else
    	error();
  	}
  	if(countOfI!=1)
    	error();
  	printf("Success\n",countOfI);
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
   printf("Error\n");
   exit(1);
}
int preced(char a,char b)
{
  	int i,j;
  	for(i=0;i<4;i++){
    	if(tab_ordr[i]==a)
      	break;
  	}
  	for(j=0;j<4;j++){
    	if(tab_ordr[j]==b)
      	break;
  	}
  	if(i==4 || j==4)
    	error();
  	else{
    	if(table[i][j]=='<')
      	return 0;
    	else if(table[i][j]=='>')
      	return 1;
    	else
      	return 2;
  	}	
}
