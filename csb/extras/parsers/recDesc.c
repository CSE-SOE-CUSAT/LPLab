#include <stdio.h>
#include <stdlib.h> 
#include <string.h>
void T();
void EPRIME();
void F();
void TPRIME();
void ERROR();
void E();
int i=0;
char str[100];
int main(){
  printf("Enter the expression:- ");
  gets(str);
   E();
  if(strlen(str)==i)
    printf("Valid Expression\n");
  else
    printf("Invalid Expression\n");
  return 0;
}
void E(){
  T();
  EPRIME();
}
void EPRIME(){
  if(str[i]=='+'){
    i++;
    T();
    EPRIME();
  }
}
void T(){
  F();
  TPRIME();
}
void TPRIME(){
   if(str[i]=='*'){
    i++;
    F();
    TPRIME();
  }
}
void F(){
   if(str[i]>='0'&&str[i]<='9'){
    i++;
    while(str[i]>='0'&&str[i]<='9')
      i++;
  }
  else{
    if(str[i]=='('){
      i++;
      E();
      if(str[i]==')')
        i++;
      else
        ERROR();
    }
    else
      ERROR();
  }
}
void ERROR(){
  printf("Invalid Expression\n");
   exit(1);
}
