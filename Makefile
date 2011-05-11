TARGET = parse

all:$(TARGET)

parse:parse.l parse.y
	flex parse.l
	bison -d parse.y
	gcc lex.yy.c -c -o parsel.o
	gcc parse.tab.c -c -o parsey.o
	gcc -o parse parsel.o parsey.o -ll

clean:
	rm -rf $(TARGET)
