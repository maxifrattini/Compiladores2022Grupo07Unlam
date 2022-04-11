/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton interface for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     CTE_INT = 258,
     CTE_REAL = 259,
     CTE_STRING = 260,
     INT = 261,
     REAL = 262,
     STRING = 263,
     IF = 264,
     THEN = 265,
     ELSE = 266,
     WHILE = 267,
     DO = 268,
     FOR = 269,
     BETWEEN = 270,
     AVG = 271,
     DEFVAR = 272,
     ENDDEC = 273,
     PARA = 274,
     PARC = 275,
     CORA = 276,
     CORC = 277,
     LLAVA = 278,
     LLAVC = 279,
     OP_AS = 280,
     OP_SUM = 281,
     OP_MUL = 282,
     OP_DIV = 283,
     OP_RES = 284,
     COMA = 285,
     PCOMA = 286,
     DPUNTO = 287,
     GUION = 288,
     MEN = 289,
     MAY = 290,
     MEN_I = 291,
     MAY_I = 292,
     DIST = 293,
     IGU = 294,
     ID = 295
   };
#endif
/* Tokens.  */
#define CTE_INT 258
#define CTE_REAL 259
#define CTE_STRING 260
#define INT 261
#define REAL 262
#define STRING 263
#define IF 264
#define THEN 265
#define ELSE 266
#define WHILE 267
#define DO 268
#define FOR 269
#define BETWEEN 270
#define AVG 271
#define DEFVAR 272
#define ENDDEC 273
#define PARA 274
#define PARC 275
#define CORA 276
#define CORC 277
#define LLAVA 278
#define LLAVC 279
#define OP_AS 280
#define OP_SUM 281
#define OP_MUL 282
#define OP_DIV 283
#define OP_RES 284
#define COMA 285
#define PCOMA 286
#define DPUNTO 287
#define GUION 288
#define MEN 289
#define MAY 290
#define MEN_I 291
#define MAY_I 292
#define DIST 293
#define IGU 294
#define ID 295




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

