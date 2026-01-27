%{
#include<stdio.h>
char ans[1000];
int i=0;
%}
%%
<<EOF>>				{ans[i++]='\0';
					return 0;}
[ \t]+				{ans[i++]=' ';}
\n					{ans[i++]='\n';}
.					{ans[i++]=yytext[0];}
%%
int main()
{
	yylex();
	printf("%s",ans);
	return 0;
}
int yywrap()
{
	return 1;
}

