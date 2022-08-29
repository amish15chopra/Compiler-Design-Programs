%{
#include <stdio.h>
#include <stdlib.h>
int yylex();
int yyerror();
int count=0;
%}

%token IF RELOP NUM ID

%%
S : ST 
 	;
ST : IF'('E')' BOD {count++;}
	;
BOD : '{'BODY'}'
	| E';'
	| ST
	;
BODY : BODY BODY
	| E';'
	| ST
	;
E : ID'='E
	| E'+'E
	| E'-'E
	| E'*'E
	| E'/'E
	| E'+''+'
	| E'-''-'
	| E RELOP E
	| ID
	| NUM
	;
%%

#include <stdio.h>

extern int yylex();
extern int yyparse();
extern FILE *yyin;

void main() {
	yyin = fopen("input.c", "r");
	yyparse();
	printf("Valid input\n");
	printf("No. of nested if statements is %d\n",count); 
}

int yyerror() {
	printf("Invalid input\n");
	exit(0);
}
