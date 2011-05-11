%{
#include <stdint.h>
#include <stdio.h>
#define YYSTYPE uint32_t
uint32_t page = 0;
uint32_t idx = 0;
%}

%token CHGPAGE INC NUMBER ENDCMD
%%
statement:      CHGPAGE NUMBER NUMBER NUMBER {
                    printf("w %d %d %d\n", $2, $3, $4);
                    if ($2 != 0x30) {
                        printf("Syntax error la: %d\n", $2);
                    }
                    if ($3 == 0x0) {    /* select page */
                        page = $4;
                        idx = 1;
                    }
                }
        | inc_state
        ;

inc_state:     INC {
//                    printf("[%d][%d] = %d\n", page, idx++, $2);
                    printf("heyinc %d\n", $1);
               }
        ;
