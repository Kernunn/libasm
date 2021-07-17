### colors ###
RESET = \033[0m
BOLD = \033[1m
RED = \033[31m
GREEN = \033[32m
GRAY = \033[2m
#########

NAME = libasm.a

CC = nasm
FLAGS = -felf64

SRC_DIR = src/
OBJ_DIR = obj/

SRC_FILES = ft_strlen.s \
			ft_write.s \
			ft_read.s \
			ft_strcpy.s \
			ft_strdup.s \
			ft_strcmp.s \
			ft_atoi_base_bonus.s \
			ft_list_push_front_bonus.s \
			ft_list_size_bonus.s \
			ft_list_sort_bonus.s \
			ft_list_remove_if_bonus.s

OBJ_FILES = $(SRC_FILES:.s=.o)

SRC = $(addprefix $(SRC_DIR), $(SRC_FILES))
OBJ = $(addprefix $(OBJ_DIR), $(OBJ_FILES))

all: $(NAME)

$(OBJ_DIR):
	@mkdir -p $(OBJ_DIR)

$(NAME): $(OBJ) | $(OBJ_DIR)
	@ar rsc $(NAME) $^
	@ranlib $(NAME)
	@echo "$(GREEN)$(BOLD)$(NAME) created!$(RESET)"

$(OBJ_DIR)%.o: $(SRC_DIR)%.s | $(OBJ_DIR)
	@$(CC) $(FLAGS) $< -o $@

test:
	@clang test/main.c $(NAME) -o test1
	@clang test/main_bonus.c $(NAME) -o test2

clean:
	@echo "$(GRAY)Deleting...$(RESET)"
	@rm -rf $(OBJ_DIR)
	@echo "$(RED)$(BOLD)Object files deleted!$(RESET)$(RED)$(RESET)"

fclean: clean
	@rm -rf $(NAME)
	@rm -rf test1 test2
	@echo "$(RED)$(BOLD)$(NAME) deleted!$(RESET)"

re: fclean all

.PHONY: all clean fclean re test
