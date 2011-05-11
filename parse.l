%{
#include <stdint.h>
#include "y.tab.h"
#define YYSTYPE uint32_t
char *endptr;
%}

%%
#.*            ;
^w              { printf("%s: ", yytext); return CHGPAGE; }
^>           { printf("%s: ", yytext); return INC; }
([0-9]|[a-fA-F]){2}    { yylval = strtol(yytext, &endptr, 16); printf("digit: %X\n", yylval); return NUMBER; }
\n      { return ENDCMD; }
%%
