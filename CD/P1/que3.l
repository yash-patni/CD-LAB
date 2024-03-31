%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
int tcs = 0;
int wip = 0;
int acc = 0;
int inf = 0;
int isys = 0;
int fc = 0;
int mc = 0;
int csec = 0;
int itc = 0;
int ecc = 0;
%}
%%
[A-Z][a-z]+ { printf("Name of Student: %s\n", yytext); }
[0-9]\.[0-9]+ { double cgpa = atof(yytext);
if (cgpa < 10.0) {
printf("CGPA: %.1f\n", cgpa);
} }
[0-9]+\.[0-9]+ {
printf("Package: %s\n",yytext);
}
[^ \t\n]+@"rknec.edu" { printf("Mail ID: %s\n", yytext); }
[1-9][0-9]+ {
printf("Mobile Number: %s\n",yytext);
}
"TCS" { tcs++; }
"WIPRO" { wip++; }
"ACCENTURE" { acc++; }
"INFOSYS" { isys++; }
"INFORMATICA" { inf++; }
"female" { fc++; }
"male" { mc++; }
"CSE" { csec++; }
"IT" { itc++; }
"EC" { ecc++; }
. { }
%%
int main(void) {
yyin = fopen("input3.txt", "r");
yylex();
printf("Number of Students Placed in TCS: %d\n", tcs);
printf("Number of Students Placed in Wipro: %d\n", wip);
printf("Number of Students Placed in Accenture: %d\n", acc);
printf("Number of Students Placed in Infosys: %d\n", isys);
printf("Number of Students Placed in Informatica: %d\n", inf);
printf("Number of Female Students: %d\n", fc);
printf("Number of Male Students: %d\n", mc);
printf("Number of CSE Students: %d\n", csec);
printf("Number of IT Students: %d\n", itc);
printf("Number of EC Students: %d\n", ecc);
fclose(yyin);
return 0;
}
int yywrap(void) {
return(1);
}