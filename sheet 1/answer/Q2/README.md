```bash

# Create a Docker image from a Dockerfile that installs and runs a database
# server (such as MySQL or PostgreSQL) and a web application (such as a
# Python Flask app) on different containers. Use Docker networking to enable
# communication between the two containers.

# Set up file and container names
Flask_IMG_DIR="flask_img"

FLASK_IMG_NAME="flask_img"

FLASK_CONTAINER_NAME="flask_container"

POSTGRES_IMG_DIR="postgres_img"

POSTGRES_IMG_NAME="postgres_img"

POSTGRES_CONTAINER_NAME="postgres_container"


# Build Docker images for Flask and PostgreSQL
docker build -t $FLASK_IMG_NAME $Flask_IMG_DIR/.
docker build -t $POSTGRES_IMG_NAME $POSTGRES_IMG_DIR/.

# Create a Docker network
NETWORK_NAME="my_network"
docker network create $NETWORK_NAME


# Run the Flask and PostgreSQL containers on the network
docker run -d --name $FLASK_CONTAINER_NAME --network $NETWORK_NAME -p 5000:5000 $FLASK_IMG_NAME
docker run -d --name $POSTGRES_CONTAINER_NAME  --network $NETWORK_NAME -e POSTGRES_PASSWORD=mypassword $POSTGRES_IMG_NAME


```