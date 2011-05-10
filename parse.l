%{
%}

%%
#.*		;
w		{ printf("%s: is change page\n", yytext); }
>		{ printf("%s: just increase and set\n", yytext); }
([0-9]|[a-fA-F]){2} 	{ printf("%s: digit\n", yytext); }
%%

main()
{
	yylex();
}



