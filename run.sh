bison -d fecha.y
flex fecha.l
gcc -o fecha.exe fecha.tab.c lex.yy.c -lfl
./fecha.exe prueba.x
