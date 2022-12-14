%{
#include<stdio.h>
int singlelinecomments=0, multilinecomments=0, newline=0, flag=0;
%}

%%
"//"[^\n]* {if (flag==0) singlelinecomments++;}
"/*" {if (flag==0) {flag=1; newline++;}} 
"*/" {if (flag==1) {flag=0; multilinecomments++;}
	  else fprintf(yyout,"*/"); }
[\n] {if (flag==1) {newline++; fprintf(yyout,"%c",yytext[0]);}
	  else fprintf(yyout,"%c",yytext[0]);}
. {if (flag==0) fprintf(yyout, "%c", yytext[0]);}
%%

void main(){	
	yyin = fopen("input.c","r");
	yyout = fopen("output.c","w");
	yylex();
	printf("No. of single line comments= %d\nNo. of multi line comments= %d\nTotal number of lines in multi-line comments= %d\n",singlelinecomments,multilinecomments,newline);
}
