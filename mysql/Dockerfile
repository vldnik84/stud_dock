FROM mysql:latest

RUN apt-get update && apt-get install -y \
        locales \
    && sed -ie "s/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/" /etc/locale.gen \
    && locale-gen \
    && export LANG="en_US.UTF-8"

ENV MYSQL_ROOT_PASSWORD=stud
ENV MYSQL_DATABASE=stud_app
ENV MYSQL_USER=stud
ENV MYSQL_PASSWORD=stud
