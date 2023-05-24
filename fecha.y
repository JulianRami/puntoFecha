/** Sección de definiciones **/
%{
#include <stdio.h> 
#include <stdlib.h>
#include <string.h>
extern int yylex (void);
extern FILE *yyin;
void yyerror (char *s);
char* getToken();
%}
%token INT CFN
/* Sección de reglas */
%%
linea      :
    | linea ifsim CFN {
    
    char* token = getToken();

    char processedToken[50];
    int index = 0;
    for (int i = 0; i < strlen(token); i++) {
        if (token[i] != '-' && token[i] != ':') {
            processedToken[index++] = token[i];
        }
    }
    processedToken[index] = '\0';
    
    FILE* archivoSalida = fopen("salida.txt", "w");
    if (archivoSalida == NULL) {
        printf("Error al abrir el archivo de salida.\n");
        exit(1);
    }

    fprintf(archivoSalida, "%sZ\n", processedToken);

    fclose(archivoSalida); 

}

ifsim : INT

%%
/** Sección de código de usuario **/
void yyerror(char *s){
    printf("Error: %s\n",s);
}
int main(int argc, char **argv){
    if(argc>1)
        yyin=fopen(argv[1], "rt");
    else
        yyin=stdin;
    yyparse();
    return 0;
}
