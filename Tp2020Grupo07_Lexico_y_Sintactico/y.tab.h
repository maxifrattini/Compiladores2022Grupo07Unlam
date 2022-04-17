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
     ID = 258,
     CTE_INT = 259,
     CTE_REAL = 260,
     CTE_STRING = 261,
     INT = 262,
     REAL = 263,
     STRING = 264,
     IF = 265,
     THEN = 266,
     ELSE = 267,
     WHILE = 268,
     DO = 269,
     FOR = 270,
     AND = 271,
     OR = 272,
     BETWEEN = 273,
     AVG = 274,
     DECVAR = 275,
     ENDDEC = 276,
     WRITE = 277,
     READ = 278,
     PARA = 279,
     PARC = 280,
     CORA = 281,
     CORC = 282,
     LLAVA = 283,
     LLAVC = 284,
     OP_AS = 285,
     OP_SUM = 286,
     OP_MUL = 287,
     OP_DIV = 288,
     OP_RES = 289,
     COMA = 290,
     PCOMA = 291,
     DPUNTO = 292,
     GUION = 293,
     MEN = 294,
     MAY = 295,
     MEN_I = 296,
     MAY_I = 297,
     DIST = 298,
     IGU = 299
   };
#endif
/* Tokens.  */
#define ID 258
#define CTE_INT 259
#define CTE_REAL 260
#define CTE_STRING 261
#define INT 262
#define REAL 263
#define STRING 264
#define IF 265
#define THEN 266
#define ELSE 267
#define WHILE 268
#define DO 269
#define FOR 270
#define AND 271
#define OR 272
#define BETWEEN 273
#define AVG 274
#define DECVAR 275
#define ENDDEC 276
#define WRITE 277
#define READ 278
#define PARA 279
#define PARC 280
#define CORA 281
#define CORC 282
#define LLAVA 283
#define LLAVC 284
#define OP_AS 285
#define OP_SUM 286
#define OP_MUL 287
#define OP_DIV 288
#define OP_RES 289
#define COMA 290
#define PCOMA 291
#define DPUNTO 292
#define GUION 293
#define MEN 294
#define MAY 295
#define MEN_I 296
#define MAY_I 297
#define DIST 298
#define IGU 299




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

