%{
#include "y.tab.h"
%}

%%
#.*		;
w		{ return CHGPAGE; } //printf("%s: is change page\n", yytext); }
>		{ return INC; } //printf("%s: just increase and set\n", yytext); }
([0-9]|[a-fA-F]){2} 	{ return NUMBER; } //printf("%s: digit\n", yytext); }
%%

main()
{
	yylex();
}



