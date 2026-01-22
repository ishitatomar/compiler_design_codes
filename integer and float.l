Design a LEX Code to identify and print integer and float value in a given input pattern.

%{
#include <stdio.h>
extern FILE *yyin;
extern FILE *yyout;
%}
%%
[0-9]+"."[0-9]+    { fprintf(yyout, "Float: %s\n", yytext); }
[0-9]+             { fprintf(yyout, "Integer: %s\n", yytext); }
.|\n               {}
%%
int yywrap()
{
    return 1;
}
int main()
{
    yyin  = fopen("input.txt", "r");
    yyout = fopen("output.txt", "w");
    if (yyin == NULL || yyout == NULL)
    {
        printf("File error\n");
        return 1;
    }
    yylex();
    fflush(yyout);
    fclose(yyin);
    fclose(yyout);
    return 0;
}
