import java_cup.runtime.Symbol;

%%
%unicode
%line
%cup


entier = [0-9]+
identEntier = [a-zA-Z_][a-zA-Z0-9_]* 
identChaine = "$"[a-zA-Z_][a-zA-Z0-9_]* 
ouverte = "("
ferme = ")"
affect = "="
espace = [ \t]
chaine = \"[^\"]*\"
print = "PRINT"
rl = "\n"

%%
"+" { return new Symbol(sym.PLUS);}
"-" {return new Symbol(sym.MINOS);}
"*" {return new Symbol(sym.MULT);}
":" {return new Symbol(sym.DIV);}
{print} {return new Symbol(sym.PRINT);} 
{entier} {return new Symbol(sym.ENTIER, new Integer(yytext())) ;}
{chaine} {return new Symbol(sym.CHAINE, new String(yytext())); }
{identEntier} {return new Symbol(sym.IDENTENTIER, new String(yytext()));}
{identChaine}  {return new Symbol(sym.IDENTCHAINE, new String(yytext()));}
{ouverte} { return new Symbol(sym.OUVERTE);}
{ferme} {return new Symbol(sym.FERME);}
{affect} {return new Symbol(sym.AFFECT);}
{rl} {return new Symbol(sym.RL);}
{espace}        { }
.                 { System.out.println( "ERREUR ligne " + yyline + ": " + yytext() + "non reconnu");}






