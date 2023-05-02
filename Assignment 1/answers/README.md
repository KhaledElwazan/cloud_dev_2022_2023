
# Assignment 1 Answer


## Technologies

* Docker
* Nodejs
* Bash script


## Dependencies:

* faker: A popular library to generate fake data.
* uuid: A library to generate unique IDs.
* express: A web application framework for building this RESTful API.

## Instructions

The instructions are quite straight forward:

1) A Person model class has been created in `person.js` file with the specified attributes, and generates a person with a unique id using the following constructor:
```javascript
    constructor(name, age, email, gender = Gender.Male) {
        this.name = name;
        this.age = age;
        this.gender = gender;
        this.email=email;
        this.id = Uuid.v4();
    }
```
2) The RESTful API server has been declared in `main.js` file which exports the `person.js` file.
3) The server starts listening on port `3000`, followed by generating 20 fake person objects to work with, using the following command:
```bash
node main.js
```
4) Based on the image `node:20-alpine3.16`, an image is created to install the dependencies and copy the needed files to install and run ther server as follows:
```Dockerfile
FROM node:20-alpine3.16

ENV NPM_CONFIG_LOGLEVEL info
ENV NODE_ENV=production

ENV PORT=3000
ENV WORK_DIR=/my_app

WORKDIR $WORK_DIR

COPY  main.js $WORK_DIR
COPY package.json $WORK_DIR
COPY person.js $WORK_DIR

RUN npm install --loglevel=warn

EXPOSE ${PORT}

CMD node main.js
```

5) Build and run the docker image
```bash
docker build -t server .
```

6) Push the image in docker hub
```bash
docker push kelwazan/server
```