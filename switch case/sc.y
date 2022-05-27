%{
#include<stdio.h>
#include<stdlib.h>
%}
%token ID NUM SWITCH CASE BREAK DEFAULT LE GE EQ NE AND OR
%right '='
%left AND OR
%left '*' '/'
%left '-' '+'
%nonassoc UMINUS
%%

S : ST {printf("Input accepted\n");exit(0);} 
  ;
ST : SWITCH '(' ID ')' '{' B '}'
   ;
B : C
  | C D
  ;
C : C C
  | CASE NUM ':' E ';'
  | BREAK ';'
  ;
D : DEFAULT ':' E ';' BREAK ';'
  ;
E : ID'='E
  | E'+'E
  | E'-'E
  | E'*'E
  | E'/'E
  | E LE E
  | E GE E
  | E EQ E
  | E NE E
  | E AND E
  | E OR E
  | ID
  | NUM
  ;

%%

int main()
{
printf("Enter the expression:\n");
yyparse();
}
int yyerror(char *error)
{
printf("%s\n",error);
}
