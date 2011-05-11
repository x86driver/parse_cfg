TARGET = parse

all:$(TARGET)

parse:parse.l parse.y
	flex parse.l
	yacc -d parse.y
	gcc -g -DYYDEBUG=1 -o $@ y.tab.c lex.yy.c -ly -ll

clean:
	rm -rf $(TARGET) *.o
