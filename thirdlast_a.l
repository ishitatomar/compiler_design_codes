/%Design a DFA in LEX Code which accepts string containing third last element ‘a’ over the input alphabet {a, b}%/
%{
#include <stdio.h>
%}

%s S1 S2 S3

%%

<INITIAL>a      { BEGIN S1; }
<INITIAL>b      { BEGIN INITIAL; }

<S1>a          { BEGIN S2; }
<S1>b          { BEGIN S2; }

<S2>a          { BEGIN S3; }
<S2>b          { BEGIN S3; }

<S3>a          { BEGIN S1; }
<S3>b          { BEGIN INITIAL; }

<INITIAL>\n     { printf("not accepted\n"); BEGIN INITIAL; }
<S1>\n          { printf("not accepted\n"); BEGIN INITIAL; }
<S2>\n          { printf("not accepted\n"); BEGIN INITIAL; }
<S3>\n          { printf("accepted\n"); BEGIN INITIAL; }

.               { printf("invalid\n"); BEGIN INITIAL; }

%%

int yywrap(void)
{
    return 1;
}

int main(void)
{
    yylex();
    return 0;
}
--------output-------
ishitatomar@ISHITAs-MacBook-Air Desktop % flex p.l    
ishitatomar@ISHITAs-MacBook-Air Desktop % gcc lex.yy.c
ishitatomar@ISHITAs-MacBook-Air Desktop % ./a.out     
aabaaa
accepted
aba
accepted
aa
not accepted
abbbbbaa
not accepted
