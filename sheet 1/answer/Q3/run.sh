# Use Docker volumes to persist data for a container running a database server
# (such as MongoDB or Cassandra). Create a Docker volume for storing the
# data and mount it in the container so that the data is not lost when the
# container is stopped or restarted.

docker volume create my-mongo-data

docker run -d --name my-mongo -v my-mongo-data:/data/db mongo