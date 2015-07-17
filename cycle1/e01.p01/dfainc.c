#include<stdio.h>
#include<string.h>
int main (int argc, char *argv[]){

	char *s=argv[1];
	int n = strlen(s);
	int flag =1;
	--n;
	while(n>=0){
	
			
		if(s[n]=='a'||s[n]=='b'){
			n--;
		//	printf("%c ",s[n]);
			continue;
		}
		else{
		flag =0;
		printf("%s\n","wrong string");
		break;}	
	}
	n =strlen(s);
	
	if(s[n-1]=='b'&& s[n-2]=='b'&& s[n-3]=='a' && flag==1){
		printf("%s\n","Matched");
	}
	 else{
		 printf("%s\n","wrong string");
	 }
	 	

}	
