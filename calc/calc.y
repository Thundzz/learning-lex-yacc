%{

#include <stdio.h>
extern int yylex();

%}

%token NUM

%%
program: expr        {printf("program\n");}
       ;

expr : expr '+' term { printf("expr %d + %d\n", $1, $3); }
     | term          { printf("expr %d\n", $1); }
     ; 

term : term '*' NUM  { printf("term %d * %d\n", $1, $3); }
     | NUM           { printf("term %d\n", $1); }
     ;

%%

int yyerror(char* msg) {
    fprintf(stderr, msg);
}

int main(void){
    if(yyparse() == 0){
        printf("parsing completed successfully.");
        return 0;
    } else {
        printf("parsing completed with error.");
        return -1;
    }
}