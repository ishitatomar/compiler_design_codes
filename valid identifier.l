Problem Statement: Design a LEX Code to identify and print valid identifier of C/C++ in a given input pattern.

%{
#include <stdio.h>
extern FILE *yyin;
extern FILE *yyout;
%}
%%
(int|float|double|char|if|else|while|for|return|break|continue|void|long|short|signed|unsigned|switch|case|default|do|static|struct|typedef|union|const|enum|extern|register|goto|sizeof)   { }
[a-zA-Z_][a-zA-Z0-9_]*   {
                            fprintf(yyout, "Valid Identifier: %s\n", yytext);
                         }
.|\n    { }
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
    fclose(yyin);
    fclose(yyout);
    return 0;
}
