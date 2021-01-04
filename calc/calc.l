%{
#include "y.tab.h"
%}

%%
[0-9]+       {/*printf("rule1 %s\n", yytext);*/ yylval = atoi(yytext); return NUM; }
[+*]         {/*printf("rule2 %s\n", yytext);*/ return yytext[0]; }
[\n\t\v ]    
%%