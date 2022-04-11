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

/* Para conseguir el numero de lineas */
%option yylineno 

DIGITO		[0-9]
LETRA		[a-zA-Z]
ESPACIO		[" "]
CARACTER	" "|"."|":"|";"|"?"|"/"|"="

INICOMEN	"-/"
FINCOMEN	"/-"

/* 0?"."{DIGITO}*|{1-9}+"."{DIGITO}*  */

CTE_REAL	(-?{DIGITO}*"."{DIGITO}*)
CTE_INT		(-?[1-9]{DIGITO}*)|0
CTE_STRING	\"({LETRA}|{DIGITO}|{CARACTER})+\"

COMENTARIOS		"-/"({LETRA}|{DIGITO}|{CARACTER})+"/-"

ID			{LETRA}|{LETRA}(({LETRA}|{DIGITO}))*

GUION		"-"
COMA		","
PCOMA		";"
PARA 		"("
PARC 		")"
CORA 		"["
CORC 		"]"
LLAVA 		"{"
LLAVC 		"}"
DPUNTO		":"


OP_AS		":""="

/* Operadores aritmeticos */
OP_SUM		"+"
OP_RES		"-" 
OP_MUL		"*"
OP_DIV		"/"

/* Operadores logicos */
MEN			"<"
MAY			">"
MEN_I		"<="
MAY_I		">="
DIST		"=!"
IGU			"=="

/* Palabras reservadas sentencias */

IF			"IF"|"if"
THEN		"THEN"|"then"
ELSE		"ELSE"|"else"
WHILE		"WHILE"|"while"
DO			"DO"|"do"
FOR			"FOR"|"for"

/* Palabras reservadas finciones especiales */

BETWEEN		"BETWEEN"
AVG			"AVG"
DECVAR		"DECVAR"
ENDDEC		"ENDDEC"

/* Palabras reservadas tipo de datos */

INT			"int"|"INT"
REAL		"real"|"REAL"
STRING		"string"|"STRING"

%%

{CTE_INT}			printf("\nTipo Entero: %s\n", yytext);
{CTE_REAL}			printf("\nTipo Real: %s\n", yytext);
{CTE_STRING}		printf("\nTipo Rtring: %s\n", yytext);

{INT}				printf("\nTipo de dato entero: %s\n", yytext);
{REAL}				printf("\nTipo de dato real: %s\n", yytext);
{STRING}			printf("\nTipo de dato string: %s\n", yytext);

{IF}				printf("\nCondicion if: %s\n", yytext);
{THEN}				printf("\nCondicion then: %s\n", yytext);
{ELSE}				printf("\nCondicion else: %s\n", yytext);
{WHILE}				printf("\nCondicion while: %s\n", yytext);
{DO}				printf("\nCondicion do: %s\n", yytext);
{FOR}				printf("\nCondicion for: %s\n", yytext);

{BETWEEN}			printf("\nPalabra reservada BETWEEN: %s\n", yytext);
{AVG}				printf("\nPalabra reservada AVG: %s\n", yytext);
{DECVAR}			printf("\nPalabra reservada DECVAR: %s\n", yytext);
{ENDDEC}			printf("\nPalabra reservada ENDDEC: %s\n", yytext);

{PARA} 				printf("\nParentesis abre: %s\n", yytext);
{PARC} 				printf("\nParentesis cierra: %s\n", yytext);
{CORA} 				printf("\nCorchete Abre: %s\n", yytext);
{CORC} 				printf("\nCorchete cierra: %s\n", yytext);
{LLAVA}				printf("\nLlave Abre: %s\n", yytext);
{LLAVC} 			printf("\nLlave Cierra: %s\n", yytext);

{OP_AS}				printf("\nOperador Asig: %s\n", yytext);
{OP_SUM}			printf("\nOperador Sum: %s\n", yytext);
{OP_MUL}			printf("\nOperador Mul: %s\n", yytext);
{OP_DIV}			printf("\nOperador Div: %s\n", yytext);

{COMA}  			printf("\nComa: %s\n", yytext);
{PCOMA}				printf("\nPunto y Coma: %s\n", yytext);
{DPUNTO}			printf("\nDos Puntos: %s\n", yytext);
{GUION}				printf("\nGuion: %s\n", yytext);


{MEN}		printf("\nSimbolo Comparador <=!>: %s\n", yytext);	
{MAY}		printf("\nSimbolo Comparador <=!>: %s\n", yytext);	
{MEN_I}		printf("\nSimbolo Comparador <=!>: %s\n", yytext);
{MAY_I}		printf("\nSimbolo Comparador <=!>: %s\n", yytext);
{DIST}		printf("\nSimbolo Comparador <=!>: %s\n", yytext);
{IGU}		printf("\nSimbolo Comparador <=!>: %s\n", yytext);

{ID}				printf("\nVariable Id: %s\n", yytext);

{COMENTARIOS}			{;}


\n\t
\n
\t
" "

. 			printf("\nCaracter Desconocido: %s\n", yytext);

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