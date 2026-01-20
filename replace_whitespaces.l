/*flex code to replace all white spaces from input file by single blank character and store output in putput file*/
%{
#include <stdio.h>
extern FILE *yyin;
extern FILE *yyout;
%}

%%
[ \t\n]+    { fprintf(yyout, " "); }
.           { fprintf(yyout, "%s", yytext); }
%%

int yywrap() {
    return 1;
}

int main() {

    yyin  = fopen("input.txt", "r");
    yyout = fopen("output.txt", "w");

    if(yyin == NULL || yyout == NULL) {
        printf("File error\n");
        return 1;
    }

    yylex();

    fclose(yyin);
    fclose(yyout);

    return 0;
}
