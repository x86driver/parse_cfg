/*
 * Copyright (C) 2011 Doremi Lin  <doremi.lin@garmin.com>
 *
 * This source code is licensed under the GNU General Public License,
 * Version 2.  See the file COPYING for more details.
 */

%{
#include <stdint.h>
#include "y.tab.h"
#define YYSTYPE uint32_t
char *endptr;
int lineno;
%}

%%
#.*     ;
^[w|>]  { return yytext[0]; }
([0-9]|[a-fA-F]){2}    { yylval = strtol(yytext, &endptr, 16); return NUMBER; }
[\t ]	;
\n      lineno++;
%%

int yyerror(char *s)
{
	fprintf(stderr, "%d: %s at %s\n", lineno, s, yytext);
}
