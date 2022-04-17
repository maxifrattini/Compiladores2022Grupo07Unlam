%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"
FILE *yyin;
int yylval; 
int yyerror();

int yylex();


%}

%token ID CTE_INT CTE_REAL CTE_STRING 
%token INT REAL STRING 
%token IF THEN ELSE WHILE DO FOR AND OR
%token BETWEEN AVG DECVAR ENDDEC WRITE READ
%token PARA PARC CORA CORC LLAVA LLAVC 
%right OP_AS 
%token OP_SUM OP_MUL OP_DIV OP_RES 
%token COMA PCOMA DPUNTO GUION 
%token MEN MAY MEN_I MAY_I DIST IGU 

%start progra

%%
progra : programa {printf("\nProgra : Programa \n");}
programa : sentencia {printf("\nPrograma : Sentencia \n");}
programa : programa sentencia {printf("\nPrograma : Programa Sentencia \n");}

sentencia : DECVAR declaraciones ENDDEC {printf("\nDEFVAR declaraciones ENDDEF \n");}

sentencia : WRITE ID {printf("\nsentencia : WRITE ID\n");}
sentencia : WRITE CTE_STRING {printf("\nsentencia : WRITE CADENA\n");}

sentencia : READ ID {printf("\nsentencia : READ ID\n");}
sentencia : READ CTE_STRING {printf("\nsentencia : READ CADENA\n");}

declaraciones: declaracion {printf("\nDeclaraciones : declaracion\n");}
declaraciones:  declaraciones declaracion {printf("\nDeclaraciones: declaraciones declaracion \n");}
declaracion: INT DPUNTO ID PCOMA {printf("\nINT DPUNTO ID PCOMA\n");}
declaracion: REAL DPUNTO ID PCOMA {printf("\nREAL DPUNTO ID PCOMA\n");}
declaracion : STRING DPUNTO ID PCOMA {printf("\nSTRING DPUNTO ID PCOMA\n");}

declaracion: INT asignacion PCOMA {printf("\nINT DPUNTO ID ExpresionPCOMA\n");}
declaracion: REAL asignacion PCOMA {printf("\nREAL DPUNTO ID Expresion PCOMA\n");}

sentencia : asignacion {printf("\nSentencia : asignacion  \n");}
sentencia : iteracion {printf("\nSentencia : iteracion \n");}
sentencia : seleccion {printf("\nSentencia : seleccion \n");}


asignacion : ID OP_AS expresion {printf("\nAsignacion : ID OP_AS Expresion \n");} 
asignacion : ID OP_AS CTE_STRING {printf("\nAsignacion : ID OP_AS Cte String\n");} 

seleccion : IF condicion THEN asignacion ELSE asignacion {printf("\nSeleccion : IF condicion THEN programa ELSE programa \n");}
seleccion : IF condicion THEN asignacion {printf("\nSeleccion : IF condicion THEN programa \n");}

iteracion : WHILE condicion LLAVA programa LLAVC {printf("\nIteracion : WHILE condicion LLAVA programa LLAVC \n");}

condicion : comparacion {printf("\nComparacion \n");} 
condicion : condicion AND comparacion {printf("\nCondicion AND Comparacion \n");} 
condicion : condicion OR comparacion {printf("\nCondicion OR Comparacion \n");} 

comparacion : BETWEEN PARA ID COMA CORA expresion PCOMA expresion CORC PARC

comparacion : expresion comparador expresion {printf("\n Expresion Comparacion Expresion : < \n");} 

comparador : MEN {printf("\n Comparador : < \n");} 
comparador : MAY {printf("\n Comparador : > \n");} 
comparador : MEN_I {printf("\n Comparador : >= \n");} 
comparador : MAY_I {printf("\n Comparador : <= \n");} 
comparador : DIST {printf("\n Comparador : != \n");} 
comparador : IGU {printf("\n Comparador : == \n");} 

expresion : expresion OP_SUM termino {printf("\nExpresion : Expresion OP_SUM Termino\n");} 
expresion : expresion OP_RES termino {printf("\nExpresion : Expresion OP_RES Termino\n");} 
expresion : termino {printf("\nExpresion : Termino\n");} 

termino : termino OP_MUL factor {printf("\nTermino : Termino OP_MUL Factor\n");} 
termino : termino OP_DIV factor {printf("\nTermino : Termino OP_DIV Factor\n");} 
termino : factor {printf("\nTermino : Factor\n");} 

factor : CTE_INT {printf("\nFactor : CTE_INT\n");} 
factor : CTE_REAL {printf("\nFactor : CTE_REAL\n");} 
factor : ID {printf("\nFactor : ID \n");} 
factor : PARA expresion PARC {printf("\nFactor : (Expresion) \n");} 
factor: AVG CORA lista CORC {printf("\nSentecia : ID OP_AS AVG PARA lista PARC \n");}
lista : expresion {printf("\nlista : expresion \n");} 
lista : lista COMA expresion {printf("\nlista : lista COMA expresion \n");} 


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

