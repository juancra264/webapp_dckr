FROM mariadb:latest
MAINTAINER juancra264 "juancra264@hotmail.com"
ADD ../sql /docker-entrypoint-initdb.d
RUN apt-get update
#RUN apt-get update && apt-get -y install vim
#EXPOSE 3306
#CMD ["mysqld"]:
