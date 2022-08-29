%{
#include<stdio.h>
int id=0, op=0, kw=0;
%}

%%
("int")|("float")|("long")|("short")|("char")|("for")|("if")|("else")|("void")|("return")|("while")|("do")|("case")|("switch")|("break")|("continue") {kw++;}
[\+\-\*\/%=><] {op++;}
[a-zA-Z_][a-zA-Z0-9_]* {id++;}
. ;
\n {return 0;}
%%

void main(int argc, char *argv[]){
	yyin = fopen(argv[1],"r");
	yylex();
	printf("No. of identifiers= %d\nNo. of operators = %d\nNo. of keywords = %d\n",id,op,kw);
}
