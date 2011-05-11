%{
#include <stdint.h>
#include <stdio.h>
#define YYSTYPE uint32_t
uint32_t page = 0;
%}

%token CHGPAGE INC NUMBER
%%
statement:      CHGPAGE NUMBER NUMBER NUMBER {
                    if ($2 != 0x30) {
                        printf("Syntax error\n");
                        return;
                    }
                    if ($3 == 0x0) {    /* select page */
                        page = $4;
                        return;
                    }
                    
                    printf("w %d %d %d\n", $2, $3, $4);
                }
        ;

inc_state:     INC NUMBER   { printf("> %s\n", $1); }
        ;
