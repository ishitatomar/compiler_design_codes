%{
#include<stdio.h>
%}
%%
<<EOF>> 							{return 0;}
"/"[a-zA-Z0-9' '\t\n]+"/"			{;}
"//".* 								{;}
.									{fprintf(yyout, "%s", yytext);}
%%
int main()
{
	yyin = fopen("input.c","r");
	yyout = fopen("output.c","w");
	yylex();
	fclose(yyin);
	fclose(yyout);
}
int yywrap()
{
	return 1;
}
