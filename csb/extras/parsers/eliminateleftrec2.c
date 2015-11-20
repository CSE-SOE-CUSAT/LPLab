#include<stdio.h>
#include<string.h>
char inp[50][50];
char out[50][50];
void im_rec(int);
void indirect(int,int);
int out_ptr=0,len;
int main(){
  	int i=0,j,f=0;
  	char key[2];
  	printf("Enter the grammer. Enter 's' to stop\n");
  	while(1){
    	scanf("%s",inp[i]);
    	if(strcmp(inp[i],"s")==0)
      	break;
    	i++;
  	}
  	len=i;
  	for(i=0;i<len;i++){
    	f=0;
    	for(j=0;inp[i][j]!='\0';j++){
      	if((inp[i][j]=='>' || inp[i][j]=='|') && inp[i][j+1]==inp[i][0]){
        	im_rec(i);
        	indirect(i,out_ptr-2);
        	f=1;
        	break;
      	}
    	}
    	if(f==0){
      	strcpy(out[out_ptr++],inp[i]);
      	indirect(i,out_ptr-1);
    	}	
  	}
  	printf("Grammer without Left Recursion\n");
  	for(i=0;i<out_ptr;i++)
    	printf("%s\n",out[i]);
  	return 0;
}
void im_rec(int i){
  	int j=0,outj=2,outj1=3;
  	char ep[11]="|epsilon";
ep[8]='\0';
  	out[out_ptr][j]=inp[i][j];
  	out[out_ptr+1][j]=inp[i][j];
  	out[out_ptr][++j]='-';
  	out[out_ptr+1][j]='\'';
  	out[out_ptr][++j]='>';
  	out[out_ptr+1][j]='-';
  	out[out_ptr+1][++j]='>';
  	do{
    	if((inp[i][j-1]=='>' || inp[i][j-1]=='|') && inp[i][j]==inp[i][0]){
    	j++;
    	if(out[out_ptr+1][outj1]!='>')
      	out[out_ptr+1][++outj1]='|';
      	while(inp[i][j]!='\0' && inp[i][j]!='|'){
        	out[out_ptr+1][++outj1]=inp[i][j++];

      	}
      	out[out_ptr+1][++outj1]=inp[i][0];
      	out[out_ptr+1][++outj1]='\'';	
    	}
    	else{
      	if(out[out_ptr][outj]!='>')
        	out[out_ptr][++outj]='|';
      	while(inp[i][j]!='\0' && inp[i][j]!='|')
        	out[out_ptr][++outj]=inp[i][j++];
      	out[out_ptr][++outj]=inp[i][0];
      	out[out_ptr][++outj]='\'';	
    	}
  	}while(inp[i][j++]!='\0');
  	out[out_ptr][++outj]='\0';
  	out[out_ptr+1][++outj1]='\0';
  	strcat(out[out_ptr+1],ep);
  	out_ptr+=2;
}
void indirect(int i,int outPtr){
  	int j=3,k,tempPtr,l,tp,m;
  	char temp[50];
  	m=i;
  	while(out[outPtr][j]!='\0'){ 
    	if(out[outPtr][j-1]=='>' || out[outPtr][j-1]=='|'){ //search each production
      	for(i=m+1;i<len;i++){ //search each rule
        	tempPtr=0;
        	if(inp[i][0]==out[outPtr][j]){ // if starting of production is a nonterminal

         	for(k=0;inp[i][k]!='\0';k++){ //search the production of nonterminal
          	if((out[outPtr][0]==inp[i][k]) && (inp[i][k-1]=='>' || inp[i][k-1]=='|')){ //check for any indirect recursion
           	l=3;
//substitute the nonterminal with its production
           	do{
            	if(out[outPtr][l]=='|' || out[outPtr][l]=='\0'){
             	tp=k+1;
             	while(inp[i][tp]!='|' && inp[i][tp]!='\0')
              	temp[tempPtr++]=inp[i][tp++];
            	}
            	if(out[outPtr][l]!='\0')
            	temp[tempPtr++]=out[outPtr][l];
           	}while(out[outPtr][l++]!='\0');
           	k=tp-1;
         	}
         	else
          	temp[tempPtr++]=inp[i][k];
         	}
         	temp[tempPtr]='\0';
         	strcpy(inp[i],temp);
       	}

     	}
   	}
   	j++;
  	}
}

