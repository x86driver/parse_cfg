%{
#include <stdint.h>
#include <stdio.h>
#define YYSTYPE uint32_t
uint32_t page = 0;
uint32_t idx = 0;
%}

%token CHGPAGE INC NUMBER ALPHA

%%
commands:   command
        |   commands command

command:  '>' NUMBER {
                printf("Yeah!\n");
            }
        |
            'w' NUMBER NUMBER NUMBER {
                printf("ohoh\n");
            }
        ;
%%
