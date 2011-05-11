%{
#include <stdint.h>
#include "y.tab.h"
#define YYSTYPE uint32_t
char *endptr;
%}

%%
#.*            ;
w              { return CHGPAGE; }
>              { return INC; }
([0-9]|[a-fA-F]){2}    { yylval = strtol(yytext, &endptr, 16); return NUMBER; }
%%
