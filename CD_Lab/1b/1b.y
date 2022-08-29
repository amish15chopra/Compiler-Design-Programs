%{
#include<stdio.h>
#include<stdlib.h>
int yylex();
int yyerror();
%}

%name parse

%%
S: A B
;
A: 'a'A'b'
|
;
B: 'b'B'c'
|
;
%%

void main(){
	printf("Enter string: ");
	yyparse();
	printf("This is a Valid string\n");
}

int yyerror(){
	printf("This is an Invalid string\n");
	exit(0);
}
