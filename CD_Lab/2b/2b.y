%{
#include<stdio.h>
#include<stdlib.h>
int yylex();
int yyerror();
%}

%name parse
%token NUM
%left '+' '-'
%left '*' '/'

%%
S: E	{printf("Result: %d\n",$$);}
;
E: E'+'E {$$ = $1 + $3;}
 | E'-'E {$$ = $1 - $3;}
 | E'*'E {$$ = $1 * $3;}
 | E'/'E {if ($3==0) {printf("Division by zero error!!\n"); exit(0);} 
		 else $$ = $1 / $3;}
 | '('E')' {$$ = $2;}
 | '-'NUM {$$ = -$2;}
 | NUM {$$ = $1;} 
;
%%

void main(){
	printf("Enter expression: ");
	yyparse();
	printf("Valid expression\n");
}

int yyerror(){	
	printf("Invalid expression\n");
	exit(0);
}
