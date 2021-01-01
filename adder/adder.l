%{
#include "adder.tab.h"

int yyerror();
%}

%%
[0-9]+        { yylval = atoi(yytext); return NUMBER; }
\+            { return PLUS; }
[ \t\n]       {}
.             {ECHO; yyerror ("unexpected character");}
%%

int yywrap (void) { return 1; }
