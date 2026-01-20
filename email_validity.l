/*email validity check */
%{
#include <stdio.h>
int valid = 0;
%}

%%
[a-zA-Z0-9._%+-]+@gmail\.com     { valid = 1; }
[a-zA-Z0-9._%+-]+@geu\.ac\.in    { valid = 1; }
[a-zA-Z0-9._%+-]+@co\.in         { valid = 1; }
.*                               { valid = 0; }
%%

int main()
{
    yyin = fopen("input.txt", "r");   // input file
    if (!yyin)
    {
        printf("Cannot open input file\n");
        return 1;
    }

    yylex();

    if (valid)
        printf("valid\n");
    else
        printf("not valid\n");

    fclose(yyin);
    return 0;
}

int yywrap()
{
    return 1;
}


---output---
geu@CSITLAB1-38:~$ flex new.l
geu@CSITLAB1-38:~$ gcc lex.yy.c
geu@CSITLAB1-38:~$ ./a.out
valid


---input in file----
ishitatomar1992@gmail.com
