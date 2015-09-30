//Tanmay Kumar Pandey
//exp 3.a
//12130083
#include<stdio.h>
#include<string.h>
int main(int argc, char* argv[])
{
     char input[15],inpst[12],outst[12],state='P';
     int i=0,j;
     char *str=argv[1];
     strcpy(input,"abcabcabcabc"); 
     strcpy(inpst,"PPPQQQRRRSSS"); //input states
     strcpy(outst,"QPPQRPQASQPP"); //output states
     printf("\nInput string is:%s \n",str);
     
     while(*str!='\0')
     {   // printf("%c",*str);
          for(j=0;j<12;j++){
         if(inpst[j]==state && input[j]==*str){
              state=outst[j];
              break;
          }
           }
          if(j==12){
          state='F'; //false flag
          break;
        }
        i++;str++;
     }
     if(state=='S')
          printf("\nValid String \n");
     else
          printf("\nInvalid String \n");
     return 0;
}

