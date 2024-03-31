%{
#include <stdio.h>
%}

%%
int|float|double|char|void { printf("Keyword: %s\n", yytext); }
[a-zA-Z][a-zA-Z0-9]* { printf("Identifier: %s\n", yytext); }
[+\-*/%] { printf("Operator: %s\n", yytext); }
[0-9]+ { printf("Constant: %s\n", yytext); }
\".*\" { printf("String: %s\n", yytext); }
[(){}\[\];,] { printf("Special symbol: %s\n", yytext); }
[^ \t\n]+ { printf("Invalid token: %s\n", yytext); }
[ \t\n] { /* ignore whitespace */ }
%%

int yywrap() {return 1;}

int main(int argc, char **argv) {
    FILE *fp;
    char filename[] = "input.txt";
    char line[100];

    fp = fopen(filename, "r");
    if (fp == NULL) {
        printf("Error opening file %s\n", filename);
        return 1;
    }

    while (fgets(line, sizeof(line), fp)) {
        yy_scan_string(line);
        yylex();
    }

    fclose(fp);
    return 0;
}
