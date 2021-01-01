%{
#include <stdio.h>

int yylex();
void yyerror(char *s);

int result;

%}

%token NUMBER PLUS
%%
program : expr PLUS expr { printf("program : %d %d\n", $1, $2, $3); result = $1 + $2; YYACCEPT; }
        ;
expr: NUMBER { printf("expr : %d\n", $1); $$ = $1; }

%%

int main(void){
    yyparse();
    printf("%d\n", result);
}

void yyerror (char *s) {fprintf (stderr, "%s\n", s);}
