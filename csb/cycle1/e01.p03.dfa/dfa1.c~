#include<stdio.h>
#include<string.h>
int main(int argc, char *argv[])
{
char* str;
int i=0,state=0;

str=argv[1];
while(str[i]!='\0')
        {
        if(state==0&&str[i]=='a')
                state=1;
        else if(state==0&&str[i]=='b')
                state=0;
        else if(state==1&&str[i]=='a')
                state=1;        
        else if(state==1&&str[i]=='b')
                state=2;
        else if(state==2&&str[i]=='a')
                state=1;
        else if(state==2&&str[i]=='b')
                state=3;
        else if(state==3&&str[i]=='a')
                state=1;
        else if(state==3&&str[i]=='b')
                state=0;
       	else
		state=4;
	  i++;
        }
if(state==3)
        printf("\nValid String\n");
else
        printf("\nInvalid String\n");
return 0;
}

