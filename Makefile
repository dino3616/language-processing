NAME = sample

all: $(NAME).tab.c lex.yy.c
	gcc $(NAME).tab.c -lfl

$(NAME).tab.c: $(NAME).y
	bison $(NAME).y

lex.yy.c: $(NAME).l
	flex $(NAME).l

clean:
	rm -f $(NAME).tab.c lex.yy.c a.out
