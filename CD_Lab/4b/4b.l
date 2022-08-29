%{
#include "y.tab.h"
extern int yylval;
%}

%%
"if" {return IF;}
"<"|">"|"=="|"<="|">="|"!=" {return RELOP;}
[0-9]+ {return NUM;}
[a-z][a-zA-Z0-9_]* {return ID;}
" " ;
[\t \n] ;
. {return yytext[0];}
%%
