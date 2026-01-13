%{
#include <stdio.h>
int newline = 0, space = 0, tab = 0, ch = 0;
%}

%%
[0-9]   { newline++; }
%%
int yywrap()
{
    return 1;
}

int main()
{
    printf("enter text\n");
    yylex();
    printf("number of digits: %d\n", newline);
    return 0;
}
