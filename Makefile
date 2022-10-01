# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: xrodrigu <xrodrigu@student.42barcel>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/09/16 20:52:25 by xrodrigu          #+#    #+#              #
#    Updated: 2022/10/01 00:08:21 by xrodrigu         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


NAME = libft.a


SRC = ft_bzero.c		ft_isalpha.c	ft_isprint.c 	ft_memcpy.c \
	  ft_strchr.c		ft_strlcpy.c 	ft_strnstr.c 	ft_toupper.c \
	  ft_calloc.c 		ft_isascii.c	ft_memchr.c 	ft_memmove.c \
	  ft_strdup.c 		ft_strlen.c  	ft_strrchr.c	ft_atoi.c \
	  ft_isalnum.c 		ft_isdigit.c 	ft_memcmp.c 	ft_memset.c \
	  ft_strlcat.c 		ft_strncmp.c 	ft_tolower.c 	ft_substr.c \
	  ft_putchar_fd.c	ft_putstr_fd.c 	ft_putendl_fd.c ft_putnbr_fd.c \
	  ft_striteri.c		ft_strmapi.c 	ft_itoa.c 		ft_strjoin.c \
	  ft_strtrim.c		ft_split.c

SRC_BONUS = ft_lstnew.c			ft_lstadd_front.c	ft_lstsize.c \
			ft_lstlast.c		ft_lstadd_back.c 	ft_lstdelone.c \
			ft_lstclear.c		ft_lstiter.c		ft_lstmap.c


BONUS = .bonus

OBJS = $(SRC:.c=.o)

OBJS_BONUS = $(SRC_BONUS:.c=.o)


DEPS = $(SRC:.c=.d)

DEPS_BONUS = $(SRC_BONUS:.c=.d)


RM = rm -f

INCLUDE = -I ./

CFLAGS = -Wall -Wextra -Werror -W #-O3 #-fsanitize=address -g3


%.o:%.c
	$(CC) $(CFLAGS) -MMD -MP $(INCLUDE) -c $< -o $@


.PHONY: all bonus clean fclean re bonus


all: $(NAME)

$(NAME): $(OBJS)
	ar -rcs $(NAME) $(OBJS)

-include $(DEPS)


bonus: $(BONUS)

$(BONUS): $(OBJS) $(OBJS_BONUS)
	touch $@
	ar -rcs $(NAME) $(OBJS) $(OBJS_BONUS)

-include $(DEPS_BONUS)


clean:
	$(RM) $(OBJS) $(OBJS_BONUS) $(DEPS) $(DEPS_BONUS)


fclean: clean
	$(RM) $(NAME) $(BONUS)


re: fclean all  
