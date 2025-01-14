CC		= gcc -Wall -Wextra -Werror -fsanitize=address -g3
NAME	= pipex
LIB	= ./libft/libft.a
HEADER	= ./src
OBJS	= $(SRCS:.c=.o)
OBJSB	= $(BONUS:.c=.o)
SRCS	=  ./src/mandatory/pipex.c ./src/mandatory/pipex_utils.c \
			./src/ft_error.c ./src/ft_waitpid.c
			

BONUS	=  ./src/bonus/pipex_bonus_utils.c ./src/bonus/pipex_bonus.c \
			./src/ft_error.c ./src/ft_waitpid.c

all:	$(NAME)


$(NAME):	$(OBJS)
	@make -C ./libft
	$(CC) $(OBJS) $(LIB) -o $(NAME)

bonus: $(OBJSB)
		@make -C ./libft
		$(CC) $(OBJSB) $(LIB) -o $(NAME)

.c.o:
			$(CC) -I $(HEADER) -c $< -o $(<:.c=.o)

clean:
	rm -rf $(OBJS)
	rm -rf $(OBJSB)

fclean:		clean
			rm -rf $(NAME) *.o
			@make fclean -C ./libft
			rm -rf ./src/mandatory/*.o
			rm -rf ./src/bonus/*.o

re:			fclean all

rebonus:	fclean bonus
