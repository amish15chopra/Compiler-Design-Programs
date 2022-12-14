%{
#include<stdio.h>
int id=0, op=0, kw=0;
%}

int "int"
float "float"
for "for"
if "if"
else "else"
break "break"
continue "continue"
while "while"
char "char"
return "return"

%%
({int}|{float}|{for}|{if}|{else}|{break}|{while}|{char}|{break}|{continue}|{return}) {kw++;}
[\+|\-|\/|\*] {op++;}
[a-zA-Z][a-zA-Z0-9]* {id++;}
\n {return 0;}
. ;
%%

void main(int argc, char* argv[]){
	yyin = fopen(argv[1],"r");
	yylex();
	printf("No. of identifiers= %d\nNo. of operators = %d\nNo. of keywords = %d\n",id,op,kw);
}
