# Project Description

This project consists of a Flutter web application and a RESTful web service built using Node.js. The Flutter web app manages a list of persons stored on the RESTful service.

## Flutter Web App

The Flutter web app utilizes the following libraries:

- provider: ^6.0.5
- json_annotation: ^4.8.1
- dio: ^5.1.1
- uuid: ^3.0.7

The app communicates with the RESTful API to perform CRUD operations on the persons list. The src project directory is found in ```frontend_flutter_src```.

## RESTful Web Service

The RESTful web service is developed using Node.js and employs the following libraries:

- express
- uuid
- faker

It provides the necessary endpoints to manage the persons list and interacts with the Flutter web app.

## Dockerization

Both the Flutter web app and the RESTful API have been containerized using Docker. Docker images were created for each component. In the root directory, you can use the following commands to build the images:

```bash
docker build -t kelwazan/flutter_server frontend_hosting/.
```

Then push the image to the online registry using the following command:

```bash
docker push kelwazan/flutter_server
```

The RESTful API image can be found on this <a href='https://github.com/KhaledElwazan/cloud_dev_2022_2023/tree/master/Assignment%201/answers'>link</a>.

YAML file (`docker-compose.yml`) was created to run them as containers.

The `docker-compose.yml` file content is as follows:

```yaml
version: '3'

services:
  
  flutter:
    image: kelwazan/flutter_server
    ports:
      - "5000:5000"
    networks: 
      mynet:
        ipv4_address: "172.16.238.11"
    depends_on: 
      - restful
    links: 
      - restful

  restful:
    image: kelwazan/restfulapi
    container_name: restfulapi-container
    ports: 
      - "3000:3000"    
    networks:
      mynet:
        ipv4_address: "172.16.238.10"
    restart: always


networks: 
  mynet:
    driver: bridge
    ipam:
      driver: default
      config:
      - subnet: 172.16.238.0/24
