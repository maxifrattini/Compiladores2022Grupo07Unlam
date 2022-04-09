%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <float.h>
/*#include <y.tab.h>*/
FILE *yyin;
int yylval;

%}
%option noyywrap
%option yylineno

DIGITO		[0-9]
LETRA		[a-zA-Z]
CARACTER	" "|"."|":"|";"|"?"|"/"|"="
GUION		"-"


INT			"int"|"INT"
REAL		"real"|"REAL"
STRING		"string"|"STRING"
CHAR		"char"|"CHAR"

ID			{LETRA}|{LETRA}(({LETRA}|{DIGITO}|{GUION})?({LETRA}|{DIGITO}))*

CTE_INT		{DIGITO}+
CTE_REAL	{DIGITO}+"."{DIGITO}+
CTE_STR		"'"({LETRA}|{DIGITO}|{CARACTER})+"'"
CTE_CHAR	"''"{LETRA}"''"

COMENTARIOS		"//"({LETRA}|{DIGITO}|{CARACTER})+


OP_AS		":""="
OP_SUM		"+"
/*OP_RES		"-" */
OP_MUL		"*"
OP_DIV		"/"

PAR_A		"("
PAR_C		")"
LLAVE_A		"{"
LLAVE_C		"}"
COR_A		"["
COR_C		"]"


COMA		","
P_COMA		";"
D_PUNTO		":"


MEN			"<"
MAY			">"
MEN_I		"<="
MAY_I		">="
DIST		"=!"
IGU			"=="

IF			"IF"|"if"
THEN		"THEN"|"then"
ELSE		"ELSE"|"else"
WHILE		"WHILE"|"while"
DO			"DO"|"do"
FOR			"FOR"|"for"


%%

{CTE_INT}			printf("\nConstante entera: %s\n", yytext);
					 
{CTE_REAL}			printf("\nConstante real: %s\n", yytext);
{CTE_STR}			printf("\nConstante string: %s\n", yytext);
{CTE_CHAR}			printf("\nConstante char: %s\n", yytext);

{INT}				printf("\nTipo de dato entero: %s\n", yytext);
{CHAR}				printf("\nTipo de dato char: %s\n", yytext);
{REAL}				printf("\nTipo de dato real: %s\n", yytext);
{STRING}			printf("\nTipo de dato string: %s\n", yytext);

{IF}				printf("\nCondicion if: %s\n", yytext);
{THEN}				printf("\nCondicion then: %s\n", yytext);
{ELSE}				printf("\nCondicion else: %s\n", yytext);
{WHILE}				printf("\nCondicion while: %s\n", yytext);
{DO}				printf("\nCondicion do: %s\n", yytext);
{FOR}				printf("\nCondicion for: %s\n", yytext);


{ID}				printf("\nVariable Id: %s\n", yytext);
		

{OP_AS}				printf("\nOperador Asig: %s\n", yytext);
{OP_SUM}			printf("\nOperador Sum: %s\n", yytext);
{OP_MUL}			printf("\nOperador Mul: %s\n", yytext);

{OP_DIV}			printf("\nOperador Div: %s\n", yytext);
{COMA}  			printf("\nComa: %s\n", yytext);
{P_COMA}			printf("\nPunto y Coma: %s\n", yytext);
{D_PUNTO}			printf("\nDos Puntos: %s\n", yytext);

{PAR_A}		printf("\nSimbolo ([{}]): %s\n", yytext);
{PAR_C}		printf("\nSimbolo ([{}]): %s\n", yytext);
{LLAVE_A}	printf("\nSimbolo ([{}]): %s\n", yytext);	
{LLAVE_C}	printf("\nSimbolo ([{}]): %s\n", yytext);	
{COR_A}		printf("\nSimbolo ([{}]): %s\n", yytext);
{COR_C}		printf("\nSimbolo ([{}]): %s\n", yytext);


{MEN}		printf("\nSimbolo Comparador <=!>: %s\n", yytext);	
{MAY}		printf("\nSimbolo Comparador <=!>: %s\n", yytext);	
{MEN_I}		printf("\nSimbolo Comparador <=!>: %s\n", yytext);
{MAY_I}		printf("\nSimbolo Comparador <=!>: %s\n", yytext);
{DIST}		printf("\nSimbolo Comparador <=!>: %s\n", yytext);
{IGU}		printf("\nSimbolo Comparador <=!>: %s\n", yytext);






{COMENTARIOS}			{;}


\n\t
\n
\t
" "


%%

int main(int argc, char *argv[])
{
	if ((yyin = fopen(argv[1], "rt")) == NULL)
	{
	printf("\n Error al abrir archico: %s\n ", argv[1]);
	
	}
	else
	{
		yylex();
	}
	fclose(yyin);
	return 0;

}

int yyerror(void)
	{
	printf("Error Lexico");
	system ("Pause");
	exit (1);
	}