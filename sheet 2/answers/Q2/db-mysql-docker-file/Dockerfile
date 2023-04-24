FROM mysql:latest

COPY databases/init.sql /docker/entrypoint-initdb.d/1-init.sql

RUN mysql 