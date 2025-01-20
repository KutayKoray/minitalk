CFLAGS = -Wall -Wextra -Werror

CLIENT_SRC = client.c
SERVER_SRC = server.c
CLIENT_BONUS_SRC = client_bonus.c
SERVER_BONUS_SRC = server_bonus.c
CLIENT_OBJ = $(CLIENT_SRC:.c=.o)
SERVER_OBJ = $(SERVER_SRC:.c=.o)
CLIENT_BONUS_OBJ = $(CLIENT_BONUS_SRC:.c=.o)
SERVER_BONUS_OBJ = $(SERVER_BONUS_SRC:.c=.o)
CLIENT_EXEC = client
SERVER_EXEC = server
CLIENT_BONUS_EXEC = client_bonus
SERVER_BONUS_EXEC = server_bonus

all: $(CLIENT_EXEC) $(SERVER_EXEC)

bonus: $(CLIENT_BONUS_EXEC) $(SERVER_BONUS_EXEC)

%.o: %.c
	$(CC) $(CFLAGS) -c $<

clean:
	rm -f $(CLIENT_OBJ) $(SERVER_OBJ)
	rm -f $(CLIENT_BONUS_OBJ) $(SERVER_BONUS_OBJ)

fclean: clean
	rm -f $(CLIENT_EXEC) $(SERVER_EXEC)
	rm -f $(CLIENT_BONUS_EXEC) $(SERVER_BONUS_EXEC)

re: fclean all

.PHONY: all clean fclean re