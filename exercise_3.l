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
^[ \t]*[A-Za-z]+[ \t]+([A-Za-z]+[ \t]+[A-Za-z]+)*[ \t]*$ printf("Unrecognized sequence of characters: %s. Too many words, expected exactly 2.\n\n", yytext);
^[ \t]*(pp+oint|poo+int|poii+nt|poinn+t|pointt+)[ \t]*[A-H]{1}[ \t]*$ printf("Unrecognized expressions: Did you mean 'point' ?\nPlease try again.\n\n");
^[ \t]*(ll+ine|lii+ne|linn+e|linee+)[ \t]*[A-H]{2}[ \t]*$  printf("Unrecognized expressions: Did you mean 'line' ?\nPlease try again.\n\n");
^[ \t]*(tt+riangle|trr+iangle|trii+angle|triaa+ngle|triann+gle|triangg+le|triangll+e|trianglee+)[ \t]*[A-H]{3}[ \t]*\n printf("Unrecognized expressions: Did you mean 'triangle' ?\nPlease try again.\n\n");
^[ \t]*(ss+quare|sqq+uare|squu+are|squaa+re|squarr+e|squaree+)[ \t]*[A-H]{4}[ \t]*\n printf("Unrecognized expressions: Did you mean 'sqaure' ?\nPlease try again.\n\n");
^[ \t]*(pp+entagon|pee+ntagon|penn+tagon|pentt+agon|pentaa+gon|pentagg+on|pentagoo+n|pentagonn+)[ \t]*[A-H]{5}[ \t]*\n printf("Unrecognized expressions: Did you mean 'pentagon' ?\nPlease try again.\n\n");
^[ \t]*(hh+exagon|hee+xagon|hexx+agon|hexaa+gon|hexagg+on|hexagoo+n|hexagonn+)[ \t]*[A-H]{6}[ \t]*\n printf("Unrecognized expressions: Did you mean 'hexagon' ?\nPlease try again.\n\n");
^[ \t]*(hh+eptagon|hee+ptagon|hepp+tagon|heptt+agon|heptaa+gon|heptagg+on|heptagoo+n|heptagonn+)[ \t]*[A-H]{7}[ \t]*\n printf("Unrecognized expressions: Did you mean 'heptagon' ?\nPlease try again.\n\n");
^[ \t]*(oo+ctagon|occ+tagon|octt+agon|octaa+gon|octagg+on|octagoo+n|octagonn+)[ \t]*[A-H]{8}[ \t]*\n printf("Unrecognized expressions: Did you mean 'octagon' ?\nPlease try again.\n\n");

^[ \t]*({point}|{line}|{triangle}|{square}|{pentagon}|{hexagon}|{heptagon}|{octagon})[ \t]*\n printf("You forgot to enter a geometric entity's name. Please try again. E.g. triangle ABC\n\n");
^[ \t]*([A-H]{1,8})[ \t]*\n printf("You forgot to enter a geomteric entity. Please try again.\n");
^({point}|{line}|{triangle}|{square}|{pentagon}|{hexagon}|{heptagon}|{octagon})[ \t]*[A-H]*[a-z]+[A-H]*[ \t]*\n printf("Only capital letters allowed for geometric entity's name. Please try again using characters between A and H.\n\n");

{point}|{line}|{triangle}|{square}|{pentagon}|{hexagon}|{heptagon}|{octagon} printf("--> %s: is a geometric entity.\n", yytext);  /* geometric entity is recognised successfully! */
                                                                                                                                
{point}[ \t]*[A-H]{2,}\n|{line}[ \t]*[A-H]{1}\n|{line}[ \t]*[A-H]{3,}\n|{triangle}[ \t]*[A-H]{1,2}\n|{triangle}[ \t]*[A-H]{4,}\n|{square}[ \t]*[A-H]{1,3}\n|{square}[ \t]*[A-H]{5,}\n|{pentagon}[ \t]*[A-H]{1,4}\n|{pentagon}[ \t]*[A-H]{6,}\n|{hexagon}[ \t]*[A-H]{1,5}\n|{hexagon}[ \t]*[A-H]{7,}\n|{heptagon}[ \t]*[A-H]{1,6}\n|{heptagon}[ \t]*[A-H]{8,}\n|{octagon}[ \t]*[A-H]{1,7}\n|{octagon}[ \t]*[A-H]{9,} printf("Invalid geometric entity's name: %s. You entered more or less letters in geometric entity's name.\n\n", yytext);
^({point}|{line}|{triangle}|{square}|{pentagon}|{hexagon}|{heptagon}|{octagon})[ \t]*[A-H]*[I-Z]+[A-H]*[ \t]*\n printf("Invalid geometric entity's name. Please try again using characters between A and H.\n\n");
[A-H]*[A][A-H]*[A][A-H]*|[A-H]*[B][A-H]*[B][A-H]*|[A-H]*[C][A-H]*[C][A-H]*|[A-H]*[D][A-H]*[D][A-H]*|[A-H]*[E][A-H]*[E][A-H]*|[A-H]*[F][A-H]*[F][A-H]*|[A-H]*[G][A-H]*[G][A-H]*|[A-H]*[H][A-H]*[H][A-H]* printf("You entered some letter twice or more: %s. Please try again.\n\n", yytext);

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
