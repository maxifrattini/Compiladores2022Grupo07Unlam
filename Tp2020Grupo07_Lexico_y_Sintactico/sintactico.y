%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"
FILE *yyin;
int yylval; 
int yyerror();

int yylex();


%}


%token CTE_INT CTE_REAL CTE_STRING INT REAL STRING IF THEN ELSE WHILE DO FOR BETWEEN 
%token AVG DEFVAR ENDDEC PARA PARC CORA CORC LLAVA LLAVC OP_AS OP_SUM OP_MUL OP_DIV OP_RES 
%token COMA PCOMA DPUNTO GUION MEN MAY MEN_I MAY_I DIST IGU ID

%%

Expresion : Termino {printf("\nExpresion : Termino\n");} 
Expresion : Expresion OP_SUM Termino {printf("\nExpresion : Expresion OP_SUM Termino\n");} 
Expresion : Expresion OP_RES Termino {printf("\nExpresion : Expresion OP_RES Termino\n");} 
Termino : Factor {printf("\nTermino : Factor\n");} 
Termino : Termino OP_MUL Factor {printf("\nTermino : Termino OP_MUL Factor\n");} 
Termino : Termino OP_DIV Factor {printf("\nTermino : Termino OP_DIV Factor\n");} 
Factor : CTE_INT {printf("\nFactor : CTE_INT\n");} 
Factor : ID {printf("\nFactor : ID \n");} 
Factor : PARA Expresion PARC {printf("\nFactor : (Expresion) \n");} 

%%

int main(int argc,char *argv[])
{
  if ((yyin = fopen(argv[1], "rt")) == NULL)
  {
	printf("\nNo se puede abrir el archivo: %s\n", argv[1]);
  }
  else
  {
	yyparse();
  }
  fclose(yyin);
  return 0;
}

