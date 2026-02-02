Design a LEX Code for tokenizing (Identify and print OPERATORS, SEPERATORS,
KEYWORDS, IDENTIFERS) the following C-fragment:
int p=1, d=0,r=4; float m=0.0,
n=200.0;
while (p <= 3)
{ if(d==0)
{ m= m+n*r+4.5; d++; }
else
{ r++; m=m+r+1000.0; } p++; }
-------------------------------

%{
#include <stdio.h>
#include <string.h>

/* Buffers to store found tokens */
char keys[100][20], ids[100][20], ops[100][10], seps[100][5];
int k_idx=0, i_idx=0, o_idx=0, s_idx=0;

/* Function to check for duplicates before adding to list */
void add_token(char list[100][20], int *count, char *val) {
    for(int i=0; i < *count; i++) {
        if(strcmp(list[i], val) == 0) return; 
    }
    strcpy(list[(*count)++], val);
}
%}

KEYWORD    (int|float|while|if|else|return)
IDENTIFIER [a-zA-Z_][a-zA-Z0-9_]*
OPERATOR   ("="|"+"|"-"|"*"|"/"|"<="|">="|"=="|"<"|">"|"++")
SEPARATOR  (";"|","|"{"|"}"|"("|")")
NUMBER     [0-9]+(\.[0-9]+)?
WHITESPACE [ \t\n]+

%%

{KEYWORD}     { add_token(keys, &k_idx, yytext); }
{IDENTIFIER}  { add_token(ids, &i_idx, yytext); }
{OPERATOR}    { add_token(ops, &o_idx, yytext); }
{SEPARATOR}   { add_token(seps, &s_idx, yytext); }
{NUMBER}      { /* Numbers ignored per request, or add another list if needed */ }
{WHITESPACE}  { ; }
.             { ; }

%%

int yywrap() { return 1; }

int main() {
    yyin = fopen("input.txt", "r");
    yyout = fopen("output.txt", "w");

    if (!yyin) return 1;

    yylex();

    fprintf(yyout, "--- CATEGORIZED TOKENS ---\n\n");

    fprintf(yyout, "KEYWORDS:   ");
    for(int i=0; i<k_idx; i++) fprintf(yyout, "%s ", keys[i]);

    fprintf(yyout, "\nIDENTIFIERS: ");
    for(int i=0; i<i_idx; i++) fprintf(yyout, "%s ", ids[i]);

    fprintf(yyout, "\nOPERATORS:   ");
    for(int i=0; i<o_idx; i++) fprintf(yyout, "%s ", ops[i]);

    fprintf(yyout, "\nSEPARATORS:  ");
    for(int i=0; i<s_idx; i++) fprintf(yyout, "%s ", seps[i]);
    
    fprintf(yyout, "\n\n--------------------------\n");

    fclose(yyin);
    fclose(yyout);
    return 0;
}

---input---
int p=1, d=0,r=4; float m=0.0,
n=200.0;
while (p <= 3)
{ if(d==0)
{ m= m+n*r+4.5; d++; }
else
{ r++; m=m+r+1000.0; } p++; }

---output---
--- CATEGORIZED TOKENS ---

KEYWORDS:   int float while if else 
IDENTIFIERS: p d r m n 
OPERATORS:   =  <=  ==  
SEPARATORS:  ,    ;  

--------------------------
