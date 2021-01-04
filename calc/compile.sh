yacc -d -Wother calc.y
lex calc.l
cc lex.yy.c  y.tab.c  -lfl