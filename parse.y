/*
 * Copyright (C) 2011 Doremi Lin  <doremi.lin@garmin.com>
 *
 * This source code is licensed under the GNU General Public License,
 * Version 2.  See the file COPYING for more details.
 */

%{
#include <stdint.h>
#include <stdio.h>
#define YYSTYPE uint32_t
void print_reg(uint32_t page, uint32_t idx, uint32_t val);

uint32_t page = 0;
uint32_t idx = 0;
%}

%token CHGPAGE INC NUMBER ALPHA

%%
commands:   command
        |   commands command

command:  '>' NUMBER {
                print_reg(page, idx++, $2);
            }
        |
            'w' NUMBER NUMBER NUMBER {
                if ($2 != 0x30) {
                    printf("Syntax error la: %d\n", $2);
                }
                if ($3 == 0x0) {    /* select page */
                    page = $4;
                    idx = 1;
                } else {            /* set specific reg */
                    print_reg(page, $3, $4);
                    idx = $3 + 1;   /* update idx */
                }
            }
        ;
%%

void print_reg(uint32_t page, uint32_t idx, uint32_t val)
{
    printf("[%d][%d] = 0x%02x\n", page, idx, val);
}
