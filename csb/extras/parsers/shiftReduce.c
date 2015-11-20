#include <stdio.h>
#include <stdlib.h> 
#include <string.h>
char str[100],stack[100];
int stkPtr=-1;
void push(char);
char pop();
char peek();
void error(int);
void display(char[],int);
int main(){
  int i,len,tp,k;
   char tmp[3],ch,dis[30];
  printf("Enter the expression:- ");
  gets(str);
  push('$');
  len=strlen(str);
  str[len]='$';
  str[len+1]='\0';
  printf("--------------------------------------------------------------------------------------------------\n");
  printf("|\t\tStack\t\t|\t\tInput\t\t|\t\tAction\t\t |\n");
  printf("--------------------------------------------------------------------------------------------------");
  for(i=0;i<len;i++){
    if(str[i]>='0' && str[i]<='9'){
      tp=i;
      while(str[i+1]>='0'&&str[i+1]<='9')
         i++;
      display("shift",tp);
      push('I');
      if(str[i+1]!='\0'){
        display("reduce:- E->I",i+1);
        ch=pop();
        push('E');
      }
    }
    else if(str[i]=='+' || str[i]=='-' || str[i]=='/' || str[i]=='*'){
       display("shift",i);
      push(str[i]);
    }
    else
      error(i);
  }
  while(stkPtr>=3){
    for(i=stkPtr,k=0;k<3;i--,k++)
      tmp[k]=stack[i];
      if(tmp[0]=='E' && (tmp[1]=='+' || tmp[1]=='-' || tmp[1]=='*' || tmp[1]=='/') && tmp[2]=='E'){
         sprintf(dis,"reduce:- E->%c%c%c",tmp[0],tmp[1],tmp[2]);
        display(dis,strlen(str)-1);
        pop();
        pop();
      }
    else
      error(strlen(str)-1);
  }
  k=stkPtr;
  for(i=stkPtr;i>=0;i--)
    tmp[i]=stack[i];
  tmp[k+1]='\0';
  if(strcmp(tmp,"$E")==0)
    display("SUCCESS",strlen(str)-1);
  else
    error(strlen(str)-1);
  printf("\n--------------------------------------------------------------------------------------------------\n"); 
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
void error(int a){
  display("ERROR",a);
  printf("\n--------------------------------------------------------------------------------------------------\n"); 
  exit(1);
}
void display(char a[100],int m){
  int j;
  char *ptr,stk[100];
  ptr=&str[m];
  printf("\n| ");
  for(j=0;j<=stkPtr;j++)
    stk[j]=stack[j];
  stk[j]='\0';
  printf("%-30s",stk);
  printf("|%25s\t",ptr);
  printf("|\t%-25s|",a);
}

