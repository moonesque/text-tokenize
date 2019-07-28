%{
#include <math.h>
int line_num = 0, chars_num = 0;
%}
DIGIT [0-9]
ID [a-zA-Z_][_a-zA-Z0-9]*
%%
\/\*[^*/]*\*\/  	/*eat up comments*/
[ \t]+			/*eat up white spaces*/
\n		{ chars_num = 0; ++line_num;}
#[^\n]*>	{ chars_num += strlen(yytext); printf("PREPROCESSOR_DIRECTIVES: %s\tLine: %i\tCharacter: %i\n", yytext, line_num, chars_num);}
\"(\\.|[^"])*\"	{ chars_num += strlen(yytext); printf("STRING: %s\tLine: %i\tCharacter: %i\n", yytext, line_num, chars_num);}
"int"		{ chars_num += strlen(yytext); printf("KEYW_INT\tLine: %i\tCharacter: %i\n", line_num, chars_num);}
"float" 	{ chars_num += strlen(yytext); printf("KEYW_FLOAT\tLine: %i\tCharacter: %i\n", line_num, chars_num);}
"for"		{ chars_num += strlen(yytext); printf("KEYW_FOR\tLine: %i\tCharacter: %i\n", line_num, chars_num);}
"if"		{ chars_num += strlen(yytext); printf("KEYW_IF\tLine: %i\tCharacter: %i\n", line_num, chars_num);}
"return"	{ chars_num += strlen(yytext); printf("KEYW_RETURN\tLine: %i\tCharacter: %i\n", line_num, chars_num);}
"break"		{ chars_num += strlen(yytext); printf("KEYW_BREAK\tLine: %i\tCharacter: %i\n", line_num, chars_num);}
{ID}		{ chars_num += strlen(yytext); printf("IDENTFIER: %s\tLine: %i\tCharacter: %i\n", yytext, line_num, chars_num);}
{ID}+"["{DIGIT}+"]"		{ chars_num += strlen(yytext); printf("IDENTIFIER_ARRAY: %s\tLine: %i\tCharacter: %i\n", yytext, line_num, chars_num);}
{DIGIT}+"."{DIGIT}*		{ chars_num += strlen(yytext); printf("FCONST: %f\tLine: %i\tCharacter: %i\n", atof(yytext), line_num, chars_num);}
{DIGIT}+	{ chars_num += strlen(yytext); printf("ICONST: %i\tLine: %i\tCharacter: %i\n", atoi(yytext), line_num, chars_num);}
"="		{ chars_num += strlen(yytext); printf("OPER_ASSIGN\tLine: %i\tCharacter: %i\n", line_num, chars_num);}
"=="		{ chars_num += strlen(yytext); printf("OPER_EQUAL\tLine: %i\tCharacter: %i\n", line_num, chars_num);}
"<"		{ chars_num += strlen(yytext); printf("OPER_LESS\tLine: %i\tCharacter: %i\n", line_num, chars_num);}
">"		{ chars_num += strlen(yytext); printf("OPER_MORE\tLine: %i\tCharacter: %i\n", line_num, chars_num);}
"++"		{ chars_num += strlen(yytext); printf("OPER_INCREMENT\tLine: %i\tCharacter: %i\n", line_num, chars_num);}
"/"		{ chars_num += strlen(yytext); printf("OPER_DIVIDE\tLine: %i\tCharacter: %i\n", line_num, chars_num);}
"+"		{ chars_num += strlen(yytext); printf("OPER_ADD\tLine: %i\tCharacter: %i\n", line_num, chars_num);}
"+="		{ chars_num += strlen(yytext); printf("OPER_ADDASSIGN\tLine: %i\tCharacter: %i\n", line_num, chars_num);}
"&"		{ chars_num += strlen(yytext); printf("OPER_ADDRESS\tLine: %i\tCharacter: %i\n", line_num, chars_num);}
","		{ chars_num += strlen(yytext); printf("SPECSYM_COMMA\tLine: %i\tCharacter: %i\n", line_num, chars_num);}
";"		{ chars_num += strlen(yytext); printf("SPECSYM_SEMICOLON\tLine: %i\tCharacter: %i\n", line_num, chars_num);}
"{"		{ chars_num += strlen(yytext); printf("SPECSYM_OPENCURLYBRACKET\tLine: %i\tCharacter: %i\n", line_num, chars_num);}
"}"		{ chars_num += strlen(yytext); printf("SPECSYM_CLOSECURLYBRACKET\tLine: %i\tCharacter: %i\n", line_num, chars_num);}
"("		{ chars_num += strlen(yytext); printf("SPECSYM_OPENPARENTHESES\tLine: %i\tCharacter: %i\n", line_num, chars_num);}
")"		{ chars_num += strlen(yytext); printf("SPECSYM_CLOSEPARENTHESES\tLine: %i\tCharacter: %i\n", line_num, chars_num);}
%%
int main(){
	yylex();
	return 0;
}
