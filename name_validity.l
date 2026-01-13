/*write a lex program to check the validity of a name*/
%{
	#include <stdio.h>
	int valid=1;
%}

%%
[0-9]+        { valid = 0; }
[^a-zA-Z\n]+  { valid = 0; }
[a-zA-Z]+	{ valid = 1; }
%%

int yywrap()
{
  return 1;
}

int main()
{
	printf("enter name: ");
	yylex();
  	if(valid)
		printf("valid name\n ");
	else
		printf("invalid name\n");
	return 0;

}
---output---
ishitatomar@ISHITAs-MacBook-Air Desktop % flex p.l     
ishitatomar@ISHITAs-MacBook-Air Desktop % gcc lex.yy.c 
ishitatomar@ISHITAs-MacBook-Air Desktop % ./a.out      
enter name: ishita

valid name

ishitatomar@ISHITAs-MacBook-Air Desktop % flex p.l     
ishitatomar@ISHITAs-MacBook-Air Desktop % gcc lex.yy.c 
ishitatomar@ISHITAs-MacBook-Air Desktop % ./a.out      
enter name: i123    

invalid name
