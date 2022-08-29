%{
#include "y.tab.h"
extern int yylval;
%}

%%
"for" {return FOR;}
[0-9]+ {return NUM;}
[a-zA-Z][a-zA-Z0-9_]* {return ID;}
"<" {return LT;}
">" {return GT;}
"<=" {return LE;}
">=" {return GE;}
"==" {return EQ;}
"!=" {return NE;}
" " ;
[\t \n] ;
. {return yytext[0];}
%%
