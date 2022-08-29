%{
#include "y.tab.h"
%}

%%
\+ {return '+';}
\- {return '-';}
\* {return '*';}
\/ {return '/';}
\( {return '(';}
\) {return ')';}
[0-9]+ { yylval = atoi(yytext); return NUM; }
. {return yytext[0];}
\n {return 0;}
%%
