CFLAGS = -Wall -Wextra -Werror

CLIENT_SRC = client.c
SERVER_SRC = server.c
CLIENT_OBJ = $(CLIENT_SRC:.c=.o)
SERVER_OBJ = $(SERVER_SRC:.c=.o)
CLIENT_EXEC = client
SERVER_EXEC = server

all: $(CLIENT_EXEC) $(SERVER_EXEC)

%.o: %.c
	$(CC) $(CFLAGS) -c $<

clean:
	rm -f $(CLIENT_OBJ) $(SERVER_OBJ)

fclean: clean
	rm -f $(CLIENT_EXEC) $(SERVER_EXEC)

re: fclean all

.PHONY: all clean fclean re