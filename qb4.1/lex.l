%{
#include<stdio.h>
#include "yacc.tab.h"
%}

%%

"+"|"-"|"*"|"/"|"++"|"--"     {return OP;}
"="   {return AOP;}
";"      {return DELIM;}
"for"   {return FOR;}
">"   {return GT;}
">="   {return GTEQ;}
"<"   {return LT;}
"<="   {return LTEQ;}
"=="     {return COMP;}

[ \t\n]+ ;
[a-zA-Z]+[a-zA-Z0-9]*    {return ID;}
[0-9]+    {return NUM;}
.  return yytext [0];

%%

int yywrap()
{
   return 1;
}