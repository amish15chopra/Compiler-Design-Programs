%{
#include<stdio.h>
int posint =0, negint =0;
int posfrac =0, negfrac =0;
%}
%%
[+]?[0-9]+ {posint++;}
[-][0-9]+ {negint++;}
[+]?[0-9]*\.[0-9]+ {posfrac++;}
[-][0-9]*\.[0-9]+ {negfrac++;}
[+]?[0-9]+[/][+]?[0-9]+ {posfrac++;}
[-][0-9]+[/][+]?[0-9]+ {negfrac++;}
[+]?[0-9]+[/][-][0-9]+ {negfrac++;}
[-][0-9]+[/][-][0-9]+ {posfrac++;}
[\n] return 0;
. ;
%%

void main(){
	printf("Enter the value: ");
	yylex();
	printf("\nNumber of positive integers :%d\nNumber of negative integers :%d\n",posint, negint);
	printf("\nNumber of positive fractions :%d\nNumber of negative fractions: %d\n",posfrac, negfrac);
}
