bison -d *.y
lex *.l


gcc lex.yy.c *.tab.c  -o main