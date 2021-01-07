from ply import lex
from ply import yacc
import time

tokens = [
    "NUMBER",
    "PLUS",
    "MUL",
    "LPAREN",
    "RPAREN"
]

precedence = (
    ("left", "PLUS"),
    ("left", "MUL")
)

t_NUMBER = r"\d+"
t_PLUS = r"\+"
t_MUL = r"\*"
t_LPAREN = r"\("
t_RPAREN = r"\)"
t_ignore =  " \t"

def t_error(t):
    print("Illegal character '%s'" % t.value[0])
    t.lexer.skip(1)

def p_expression_mul(p):
    """
    expression : expression MUL expression
    """
    p[0] = p[1] * p[3]

def p_expression_plus(p):
    'expression :  expression PLUS expression'
    p[0] = p[1] + p[3]

def p_expression_constant(p):
    """
    expression : NUMBER
    """
    p[0] = int(p[1])


def p_paren_expression_constant(p):
    """
    expression : LPAREN expression RPAREN
    """
    p[0] = p[2]

def p_error(p):
    print("Syntax error in input!")

lexer = lex.lex()
parser = yacc.yacc()

lexer.input("2+2")

while True:
    try:
        s = input('adder > ')
    except EOFError:
        break
    if not s: continue
    result = parser.parse(s)
    print(result)
 