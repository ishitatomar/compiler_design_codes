%{
#include <stdio.h>
int newline = 0, space = 0, tab = 0, ch = 0;
%}

%%
\n      { newline++; }
\t      { tab++; }
" "     { space++; }
.       { ch++; }
%%

int yywrap()
{
    return 1;
}

int main()
{
    printf("enter text\n");
    yylex();
    printf("number of lines: %d\n", newline);
    printf("number of tabs: %d\n", tab);
    printf("number of spaces: %d\n", space);
    printf("number of characters: %d\n", ch);
    return 0;
}
