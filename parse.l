%{
#include "parse.tab.h"
%}

%%
#.*		;
w		{ return CHGPAGE; }
>		{ return INC; }
([0-9]|[a-fA-F]){2}	{ return NUMBER; }
%%

main()
{
	yylex();
}



