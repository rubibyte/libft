# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: xrodrigu <xrodrigu@student.42barcel>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/09/16 20:52:25 by xrodrigu          #+#    #+#              #
#    Updated: 2022/11/04 19:48:51 by xrodrigu         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


NAME = libft.a

SRC_DIR = src

OBJ_DIR = .obj

DEP_DIR = .dep


#colors
NC = \033[0m
GREEN = \033[0;32m
RED = \033[0;31m


SRC = is/ft_isalnum.c	is/ft_isalpha.c	is/ft_isascii.c	is/ft_isdigit.c \
	  is/ft_isprint.c \
	  \
	  math/ft_absval.c	math/ft_atoi.c	math/ft_itoa.c	math/ft_ltoa_base.c \
	  math/ft_ltoa.c	math/ft_nbrlen_base.c			math/ft_nbrlen.c \
	  math/ft_unsignedlen_base.c		math/ft_unsignedlen.c \
	  math/ft_unsignedtoa_base.c		math/ft_unsignedtoa.c \
	  \
	  mem/ft_bzero.c	mem/ft_calloc.c	mem/ft_memchr.c	mem/ft_memcmp.c \
	  mem/ft_memcpy.c	mem/ft_memmove.c				mem/ft_memset.c \
	  \
	  put_fd/ft_putchar_fd.c  			put_fd/ft_putendl_fd.c \
	  put_fd/ft_putnbr_fd.c				put_fd/ft_putstr_fd.c \
	  \
	  str/ft_split.c	str/ft_strdup.c	str/ft_strjoin.c \
	  str/ft_strlcpy.c	str/ft_strmapi.c				str/ft_strnstr.c \
	  str/ft_strtrim.c	str/ft_strchr.c	str/ft_striteri.c \
	  str/ft_strlcat.c  str/ft_strlen.c	str/ft_strncmp.c \
	  str/ft_strrchr.c  str/ft_substr.c \
	  \
	  to/ft_tolower.c	to/ft_toupper.c


OBJ = $(addprefix $(OBJ_DIR)/, $(SRC:.c=.o))

DEP = $(addprefix $(DEP_DIR)/, $(SRC:.c=.d))


MAKEFILE = Makefile

AR = ar -rcs

CFLAGS = -Wall -Wextra -Werror -W #-Ofast -O3 -fsanitize=address -g3

DEP_FLAGS = -MT $@ -MMD -MP

INCLUDE = -Iinclude/

RM = rm -f

RM_DIR = rm -rf


$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c $(MAKEFILE)
	@mkdir -p $(dir $@) $(dir $(subst $(OBJ_DIR)/, $(DEP_DIR)/, $@))
	@$(CC) $(CFLAGS) $(DEP_FLAGS) $(INCLUDE) -c $< -o $@
	@mv $(patsubst %.o, %.d, $@) $(dir $(subst $(OBJ_DIR)/, $(DEP_DIR)/, $@))

all:
	@$(MAKE) $(NAME)


$(NAME): $(OBJ)
	@$(AR) $(NAME) $(OBJ)
	@printf "${GREEN}[LIBFT]->Objects and dependencies created.${NC}\n"
	@printf "${GREEN}[LIBFT]->Library created.${NC}\n"


clean:
	@$(RM_DIR) $(OBJ_DIR) $(DEP_DIR)
	@printf "${GREEN}[LIBFT]->Objects directory ${RED}deleted${NC} ${GREEN}successfully.${NC}\n"
	@printf "${GREEN}[LIBFT]->Dependencies directory ${RED}deleted${NC} ${GREEN}successfully.${NC}\n"


fclean:
	@$(MAKE) clean
	@$(RM) $(NAME)
	@printf "${GREEN}[LIBFT]->All files cleaned!${NC}\n"


re:
	@$(MAKE) fclean
	@$(MAKE) all


-include $(DEP)

.PHONY: all clean fclean re
