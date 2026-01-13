/*write a lex program to print every alternate character of a given input*/
%{
	#include <stdio.h>
	int i=0;
%}

%%
. {
	if(i%2==0)
		printf("%c\n",yytext[0]);
	i++;
}
%%

int yywrap()
{
  return 1;
}

int main()
{
	printf("enter name: ");
	yylex();
	return 0;
}

---output---
ishitatomar@ISHITAs-MacBook-Air Desktop % flex p.l     
ishitatomar@ISHITAs-MacBook-Air Desktop % gcc lex.yy.c 
ishitatomar@ISHITAs-MacBook-Air Desktop % ./a.out      
enter name: ishita
i
h
t
