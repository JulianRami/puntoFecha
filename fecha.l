/** Sección de definiciones **/
%{
#include "fecha.tab.h"
#include <string.h>
char token[50];

char* getToken() {
    return token;
}

%}
/** Sección de reglas **/
digito             [0-9]
identificador      [A-Z]
%%
\s*[0-9]{4}-[0-9]{2}-[0-9]{2}T[0-9]{2}:[0-9]{2}:[0-9]{2}\s*$    {strcpy(token, yytext); return INT;}
\n                                                              {return CFN;}
[ \t]                                                           {/*Ignorar espacios*/}
.                                                               {printf("Error en el formato: %s\n" ,yytext);}
%%
/** Sección de codigo de usuario **/
