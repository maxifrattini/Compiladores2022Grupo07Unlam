%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <float.h>
#include "y.tab.h"

FILE *yyin;

int yylval; 

int yyerror(void)
	{
	printf("Error Lexico");
	system ("Pause");
	exit (1);
	}

int verificaInt(char *ptr){
	int value = atoi(ptr);
	if (value < -32768 || value > 32767 ) {
		printf("\nError Variable fuera de rango!! %s\n", yytext);
		return yyerror();
		
	}
	return 0;

}

double verificaReal(char *ptrf){
	double valuef = atoi(ptrf);
	if (valuef < -2147483648 || valuef > 2147483647 )  {
		printf("\nERROR Lexico - Float \'%s\' fuera de rango. Debe estar entre [−2.147.483.648 +2.147.483.647]\n",yytext);
		return yyerror();
		
	}
	return 0;

}

int verificaString(char *ptrs){	
	int longitud = strlen(ptrs);
							//en lugar de 30 verifica con 32 porque el string viene entre comillas
							if(longitud > 32){
								char msg[150];
								printf("ERROR Lexico - Cadena \'%s\' demasiado larga. Maximo de 30 caracteres y contiene: %d", yytext, longitud-2);
								return yyerror();
							}
							return 0;
								
						}


%}

%option noyywrap

/* Para conseguir el numero de lineas */
%option yylineno 

DIGITO		[0-9]
LETRA		[a-zA-Z]
ESPACIO		[" "]
CARACTER	" "|"&"|"%"|"$"|"#"|"@"|"!"

INICOMEN	"-/"
FINCOMEN	"/-"

/* 0?"."{DIGITO}*|{1-9}+"."{DIGITO}*  */


CTE_INT		(-?[1-9]{DIGITO}*)|0
CTE_REAL	{DIGITO}+"."{DIGITO}*
CTE_STRING	\"({LETRA}|{DIGITO}|{CARACTER})+\"

COMENTARIOS		"-/"({LETRA}|{DIGITO}|{CARACTER})+"/-"

ID			{LETRA}|{LETRA}(({LETRA}|{DIGITO}))*


COMA		","
PCOMA		";"
PARA 		"("
PARC 		")"
CORA 		"["
CORC 		"]"
LLAVA 		"{"
LLAVC 		"}"
DPUNTO		":"
NOT			"!="

OP_AS		":="

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

AND			"AND"|"and"
OR			"OR"|"or"

/* Palabras reservadas finciones especiales */

BETWEEN		"BETWEEN"
AVG			"AVG"
DECVAR		"DECVAR"
ENDDEC		"ENDDEC"
WRITE		"WRITE"
READ		"READ"

/* Palabras reservadas tipo de datos */

INT			"int"|"INT"
REAL		"real"|"REAL"
STRING		"string"|"STRING"

%%


{OP_AS}				{ return OP_AS; }

{CTE_INT}			{ verificaInt(yytext); return CTE_INT; }
{CTE_REAL}			{ printf("\nTipo Real: %s\n", yytext); verificaReal(yytext); return CTE_REAL; }
{CTE_STRING}		{ verificaString(yytext); return CTE_STRING; }

{INT}				{ return INT; }
{REAL}				{ return REAL; }
{STRING}			{ return STRING; }

{IF}				{ return IF; }
{THEN}				{ return THEN; }
{ELSE}				{ return ELSE; }
{WHILE}				{ return WHILE; }
{DO}				{ return DO; }
{FOR}				{ return FOR; }

{AND}				{ return AND; }
{OR}				{ return OR; }
{NOT}				{ return NOT; }

{BETWEEN}			{ return BETWEEN; }
{AVG}				{ return AVG; }
{DECVAR}			{ return DECVAR; }
{ENDDEC}			{ return ENDDEC; }

{WRITE}				{ return WRITE; }
{READ}				{ return READ; }
	
{PARA} 				{ return PARA; }
{PARC} 				{ return PARC; }
{CORA} 				{ return CORA; }
{CORC} 				{ return CORC; }
{LLAVA}				{ return LLAVA; }
{LLAVC} 			{ return LLAVC; }




{OP_SUM}			{ return OP_SUM; }
{OP_RES}			{ return OP_RES; }
{OP_MUL}			{ return OP_MUL; }
{OP_DIV}			{ return OP_DIV; }


{COMA}  			{ return COMA; }
{PCOMA}				{ return PCOMA; }
{DPUNTO}			{ return DPUNTO; }


{MEN}				{ return MEN; }
{MAY}				{ return MAY; }	
{MEN_I}				{ return MEN_I; }
{MAY_I}				{ return MAY_I; }
{DIST}				{ return DIST; }
{IGU}				{ return IGU; }


{ID}				{return ID; }

{COMENTARIOS}			{;}


\n\t
\n
\t
" "

. 			 {printf("\nCaracter Desconocido: %s\n", yytext); yyerror();}

%%



