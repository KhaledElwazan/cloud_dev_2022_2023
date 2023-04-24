## Question 2
Use Docker Compose to launch multiple containers that make up a multi-service application. Configure the containers to use a shared network and enable communication between them.

## Solution

0) In order for this example to work, you need to create a database first with data; this can be easily achieved using docker volume and mounting this volume later:

```sql
create database campus;
use campus;

create table students(id int, name varchar(50) not null, age int,primary key(id));

insert into students values(1,'khaled',20);
insert into students values(2,'zeinab',21);
insert into students values(3,'fatma',22);
```

1) Create a `docker-compose.yml` file with the following content:

```yaml
version: "3.7"
services:
  mysql_db:
    image: mysql:latest
    restart: always
    ports:
      - 1234:3306
    environment:
      MYSQL_ROOT_PASSWORD: my-secret-pw
      MYSQL_DATABASE: campus
    volumes:
      - ./db:/var/lib/mysql
    networks:
      - campus-network

  mysql_flask:
    build: server-docker-file/.
    restart: always
    ports:
      - "12345:5000"
    depends_on:
      - mysql_db
    environment:
      MYSQL_HOST: db_mysql
      MYSQL_PORT: 3306
      MYSQL_ROOT_PASSWORD: my-secret-pw
      MYSQL_DATABASE: campus
    networks:
      - campus-network

networks:
  campus-network:
    driver: bridge

```


2) Launch the containers:

```bash
docker compose up
```

3) Verify that the web application can communicate with the database by submitting and retrieving data through the Flask app.