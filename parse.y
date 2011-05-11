%{
#include <stdio.h>
%}

%token CHGPAGE INC NUMBER
%%
statement:      CHGPAGE NUMBER NUMBER NUMBER {
                    if (strcmp($1, "00")) {
                        printf("Error while w 0\n");
                        return;
                    }
                    printf("w %s %s %s\n", $1, $2, $3);
                }
        |       inc_state {
                    printf("inc state\n");
                }
        ;

inc_state:     INC NUMBER   { printf("> %s\n", $1); }
        ;
%%

void yyerror(char *s)
{
    fprintf(stderr, "Error: %s\n", s);
}

