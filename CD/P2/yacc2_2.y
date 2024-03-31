%{
#include<stdio.h>
#include<stdlib.h>
%}
%token IDA IDB IDC IDD NL

%%
stmt : st1 st2 NL { printf("\nValid expression\n",$1); 
	exit(0);}  

st1 : IDA IDB st1
| /* epsilon */
;
st2 : IDC IDD st2
| /* epsilon */
;

%%
int yyerror(char *msg)
{
	printf("Invalid Expression \n");
	exit(0);
}
main()
{
	printf("Enter the expression : \n");
	yyparse();
}
int yywrap(){return 1;}
