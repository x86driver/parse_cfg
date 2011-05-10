%token CHGPAGE INC NUMBER
%%
statement:      CHGPAGE NUMBER NUMBER NUMBER { printf("
        |       inc_state              { printf("= %d\n", $1); }
        ;

inc_state:     INC NUMBER   { $$ = $1 + $3; }
        ;
%%
