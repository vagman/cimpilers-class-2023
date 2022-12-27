/* <IMPORTS> */
%{
%}
/* </IMPORTS> */

/* <RULES AND TOKENS> */
point (?i:point)
line (?i:line)
triangle (?i:triangle)
square (?i:square)
pentagon (?i:pentagon)
hexagon (?i:pehagon)
heptagon (?i:heptagon)
octagon (?i:octagon)
/* </RULES AND TOKENS> */

/* <RULES> */
%%
^[ \t]*({point}|{line}|{triangle}|{square}|{pentagon}|{hexagon}|{heptagon}|{octagon})[ \t]*$ printf("You forgot to enter the geometric entity's name e.g. triangle ABC. Please try again.\n\n");
^[ \t]*([A-Z]{1,8})[ \t]*$ printf("You forgot to enter a geomteric entity e.g. triangle. Please try again.\n\n");
{point}|{line}|{triangle}|{square}|{pentagon}|{hexagon}|{heptagon}|{octagon} printf("--> %s: is a geometric entity.\n", yytext);  /* geometric entity is recognised! */

^[ \t]*({point}|{line}|{triangle}|{square}|{pentagon}|{hexagon}|{heptagon}|{octagon})[ \t]*[A-Z]*([a-z])+[A-Z]*([a-z])*[ \t]*$ printf("Only Capital letters allowed for geometric entity's name. Please try again with characters from A to Z.\n\n");
{point}[ \t]*[A-Z]{2,}|{line}[ \t]*[A-Z]{1}|{line}[ \t]*[A-Z]{3,}|{triangle}[ \t]*[A-Z]{1,2}|{triangle}[ \t]*[A-Z]{4,}|{square}[ \t]*[A-Z]{1,3}|{square}[ \t]*[A-Z]{5,}|{pentagon}[ \t]*[A-Z]{1,4}\n|{pentagon}[ \t]*[A-Z]{6,}|{hexagon}[ \t]*[A-Z]{1,5}|{hexagon}[ \t]*[A-Z]{7,}|{heptagon}[ \t]*[A-Z]{1,6}|{heptagon}[ \t]*[A-Z]{8,}|{octagon}[ \t]*[A-Z]{1,7}|{octagon}[ \t]*[A-Z]{9,} printf("Invalid geometric entity's name. Please try again.\n\n");

[A-Z]+\ printf("Oops! You entered some letter twice. Please try again: %s\n", yytext);

[A-Z]{1,8} printf("--> %s: is a geometric entity's name.\n\n", yytext);   /* geometric entity's name is recognised! */

[ \t\n]+
.+
%%
/* </RULES> */

int main(){
    yylex();
}
int yywrap(){}