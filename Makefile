TARGET = parse

all:$(TARGET)

parse:parse.l
	flex parse.l
	gcc lex.yy.c -o parse -ll

clean:
	rm -rf $(TARGET)
