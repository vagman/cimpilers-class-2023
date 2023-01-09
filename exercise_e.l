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
hexagon (?i:hexagon)
heptagon (?i:heptagon)
octagon (?i:octagon)
/* </RULES AND TOKENS> */

/* <REGULAR EXPRESSIONS> */
%%
^({point}|{line}|{triangle}|{square}|{pentagon}|{hexagon}|{heptagon}|{octagon})[ \t]*\n printf("You forgot to enter a geometric entity's name. Please try again. E.g. triangle ABC\n\n");
^[ \t]*([A-H]{1,8})[ \t]*\n printf("Oops! You forgot to enter a geomteric entity. Please try again.\n");
^({point}|{line}|{triangle}|{square}|{pentagon}|{hexagon}|{heptagon}|{octagon})[ \t]*[A-H]*[a-z]+[A-H]*[ \t]*\n printf("Only capital letters allowed for geometric entity's name. Please try again using characters between A and H.\n\n");
{point}|{line}|{triangle}|{square}|{pentagon}|{hexagon}|{heptagon}|{octagon}\n printf("--> %s: is a geometric entity.\n", yytext);  /* geometric entity is recognised successfully! */
                                                                                                                                
{point}[ \t]*[A-Z]{2,}\n|{line}[ \t]*[A-Z]{1}\n|{line}[ \t]*[A-Z]{3,}\n|{triangle}[ \t]*[A-Z]{1,2}\n|{triangle}[ \t]*[A-Z]{4,}\n|{square}[ \t]*[A-Z]{1,3}\n|{square}[ \t]*[A-Z]{5,}\n|{pentagon}[ \t]*[A-Z]{1,4}\n|{pentagon}[ \t]*[A-Z]{6,}\n|{hexagon}[ \t]*[A-Z]{1,5}\n|{hexagon}[ \t]*[A-Z]{7,}\n|{heptagon}[ \t]*[A-Z]{1,6}\n|{heptagon}[ \t]*[A-ZH]{8,}\n|{octagon}[ \t]*[A-Z]{1,7}\n|{octagon}[ \t]*[A-Z]{9,} printf("Invalid geometric entity's name: You entered more or less letters in geometric entity's name.\n\n");
^({point}|{line}|{triangle}|{square}|{pentagon}|{hexagon}|{heptagon}|{octagon})[ \t]*[A-H]*[I-Z]+[A-H]*[ \t]*\n printf("Invalid geometric entity's name. Please try again using characters between A and H.\n\n");
[A-H]*[A][A-H]*[A][A-H]*|[A-H]*[B][A-H]*[B][A-H]*|[A-H]*[C][A-H]*[C][A-H]*|[A-H]*[D][A-H]*[D][A-H]*|[A-H]*[E][A-H]*[E][A-H]*|[A-H]*[F][A-H]*[F][A-H]*|[A-H]*[G][A-H]*[G][A-H]*|[A-H]*[H][A-H]*[H][A-H]* printf("You entered some letter twice: %s. Please try again.\n\n", yytext);

[A-H]{1,8} printf("--> %s: is a geometric entity's name.\n\n", yytext);   /* geometric entity's name is recognised! */
[ \t\n]+ /* eat up whitespace characters */
. /* Everything else */
%%
/*</ REGULAR EXPRESSIONS> */

int main(argc, argv)
int argc;
char **argv;
{
++argv, --argc;
if (argc > 0) {
    yyin = fopen(argv[0], "r");
} else {
    yyin = stdin;
}
yylex();
}
int yywrap(){}
