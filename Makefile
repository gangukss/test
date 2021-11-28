# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: kankim <kankim@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/11/23 14:25:20 by kankim            #+#    #+#              #
#    Updated: 2021/11/25 20:39:26 by kankim           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = Inception

all: $(NAME)

$(NAME):
	mkdir -p /home/kankim/data/wp
	mkdir -p /home/kankim/data/db
	docker-compose --project-directory srcs -f srcs/docker-compose.yml up --build -d

clean:
	docker-compose --project-directory srcs -f srcs/docker-compose.yml down

re:	fclean all

fclean:
	docker-compose --project-directory srcs -f srcs/docker-compose.yml down --rmi all -v
	rm -rf /home/kankim/data

setup:
	sudo chmod 777 /var/run/docker.sock
	echo "127.0.0.1	kankim.42.fr" | sudo tee -a /etc/hosts

.PHONY:	all clean fclean re
