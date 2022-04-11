%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <float.h>
/*#include <y.tab.h>*/
FILE *yyin;
int yylval; 

%}


%token CTE_INT CTE_REAL CTE_STRING INT REAL STRING IF THEN ELSE WHILE DO FOR BETWEEN 
%token AVG DEFVAR ENDDEC PARA PARC CORA CORC LLAVA LLAVC OP_AS OP_SUM OP_MUL OP_DIV OP_RES 
%token COMA PCOMA DPUNTO GUION MEN MAY MEN_I MAY_I DIST IGU ID

%%

Expresion : Termino ;
Expresion : Expresion OP_SUM Termino ;
Expresion : Expresion OP_RES Termino ;
Termino : Factor;
Termino : Termino OP_DIV Factor ;
Termino : Termino OP_DIV Factor;
Factor : CTE_INT ;
Factor : ID ;


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