%{
#include <stdio.h>

int yylex();
void yyerror(char *s);

int result;

%}

%token NUMBER PLUS
%%
program : expr PLUS expr { result = $1 + $3; YYACCEPT; }
        ;
expr: NUMBER { $$ = $1; }

%%

int main(void){
    yyparse();
    printf("%d\n", result);
}

void yyerror (char *s) {fprintf (stderr, "%s\n", s);}
