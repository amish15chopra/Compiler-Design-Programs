%{
#include<stdio.h>
#include<fcntl.h>
int characters=0,words=0,lines=0,spaces=0;
%}
%%
"end" {return 0;}
[a-zA-Z]+ {
	words++;
	characters=characters+yyleng;
}
\t {spaces=spaces+4;}
" " {spaces++;}
\n {lines++;}
. {characters++;}

%%
void main(int argc, char *argv[]){
	/*
	if(argc>1){
		FILE *fp= fopen(argv[1],"r");
		if(fp)
			yyin=fp;
	}*/
	printf("Enter paragraph: ");
	yylex();
	printf("No. of characters = %d\nNo. of words= %d\nNo. of lines= %d\nNo. of whitespaces = %d\n",characters,words,lines,spaces); 
}
