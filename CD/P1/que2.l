%{
#include<stdio.h>
#include<string.h>
int words=0, lines=0, small=0, capital=0, digits=0, special=0, questions=0;
char date[10], sem[10];
%}

%%

[A-Z] { capital++; }
[a-z] { small++; }
[0-9] { digits++; }
[ \t ' '] { words++; }
\n { lines++; words++;}
"Question" { questions++; }
[^A-Za-z0-9 \t\n] { special++; }
[0-30]+"/"[1-12]+"/"[0-9]+ { strncpy(date, yytext, sizeof(date)); }
"Sem: ".* { strncpy(sem, yytext+5, sizeof(sem)); }

%%

int main()
{
    yyin= fopen("input2.txt","r");
    yylex();
    printf("Date of examination : %s\n", date);
    printf("Semester : %s\n", sem);
    printf("Number of words : %d\n", words);
    printf("Number of lines : %d\n", lines);
    printf("Number of small letters : %d\n", small);
    printf("Number of capital letters : %d\n", capital);
    printf("Number of digits : %d\n", digits);
    printf("Number of special characters : %d\n", special);
    printf("Number of questions : %d\n", questions);
    return 0;
}

int yywrap()
{
    return 1;
}