%{
#include "y.tab.h";
extern yylval;
%}

%%
for {return FOR;}
while {return WHILE;}
int|float|char|void {return TYPE;}
if {return IF;}
return {return RETURN;}
[\t \n] ;
[0-9]+ {return NUM;}
[a-zA-Z][a-zA-Z]* {return ID;}
"<" {return LT;}
">" {return GT;}
"<=" {return LE;}
">=" {return GE;}
"==" {return EQ;}
"!=" {return NE;}
. {return yytext[0];}
%%
