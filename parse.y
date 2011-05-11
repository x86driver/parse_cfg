%{
#include <stdint.h>
#include <stdio.h>
#define YYSTYPE uint32_t
uint32_t page = 0;
uint32_t idx = 0;
%}

%token CHGPAGE INC NUMBER
%%
statement:      CHGPAGE NUMBER NUMBER NUMBER {
                    printf("w %d %d %d\n", $2, $3, $4);
                    if ($2 != 0x30) {
                        printf("Syntax error\n");
                        return;
                    }
                    if ($3 == 0x0) {    /* select page */
                        page = $4;
                        idx = 1;
                        return;
                    }
                }
        | inc_state
        ;

inc_state:     INC NUMBER   {
//                    printf("[%d][%d] = %d\n", page, idx++, $2);
                    printf("inc %d\n", $2);
               }
        ;
