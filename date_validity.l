/*date validity*/
%{
#include <stdio.h>
int valid = 0;
extern FILE *yyin;
%}

%%
"(0[1-9]|[12][0-9]|3[01])\/(01|03|05|07|08|10|12)\/[0-9]{4}"   { valid = 1; }
"(0[1-9]|[12][0-9]|30)\/(04|06|09|11)\/[0-9]{4}"              { valid = 1; }
"(0[1-9]|1[0-9]|2[0-8])\/02\/[0-9]{4}"                        { valid = 1; }
"29\/02\/[0-9]{2}([02468][048]|[13579][26])"                  { valid = 1; }
.*                                                            { valid = 0; }
%%

int main()
{
    yyin = fopen("input.txt", "r");

    if (!yyin)
    {
        printf("Cannot open input file\n");
        return 1;
    }

    yylex();

    if (valid)
        printf("Valid Date\n");
    else
        printf("Invalid Date\n");

    fclose(yyin);
    return 0;
}

int yywrap()
{
    return 1;
}

----input-----
29/02/2023

---output---
ishitatomar@ISHITAs-MacBook-Air Desktop % flex p.l
ishitatomar@ISHITAs-MacBook-Air Desktop % gcc lex.yy.c
ishitatomar@ISHITAs-MacBook-Air Desktop % ./a.out     

Invalid Date

----input-----
28/01/2023

---output---
ishitatomar@ISHITAs-MacBook-Air Desktop % flex p.l
ishitatomar@ISHITAs-MacBook-Air Desktop % gcc lex.yy.c
ishitatomar@ISHITAs-MacBook-Air Desktop % ./a.out     

Valid Date
