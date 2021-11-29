# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: kankim <kankim@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/11/23 14:25:20 by kankim            #+#    #+#              #
#    Updated: 2021/11/29 12:07:30 by kankim           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = Inception

all: $(NAME)

$(NAME):
	mkdir -p /home/kankim/data/database
	mkdir -p /home/kankin/data/wordpress
	docker-compose --project-directory srcs -f srcs/docker-compose.yml up --build -d

clean:
	docker-compose --project-directory srcs -f srcs/docker-compose.yml down

re:	fclean all

fclean:
	docker-compose --project-directory srcs -f srcs/docker-compose.yml down --rmi all -v
	rm -rf /home/kankim/data

set:
	sudo groupadd docker
	sudo usermod -aG docker $USER
	sudo chmod 777 /var/run/docker.sock
	echo "127.0.0.1	kankim.42.fr" | sudo tee -a /etc/hosts

.PHONY:	all clean fclean re set reset
