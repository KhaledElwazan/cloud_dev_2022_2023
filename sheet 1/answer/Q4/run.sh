# Use Docker to run a legacy application that requires a specific version of an
# operating system or library. Create a Docker image that includes the required
# software and dependencies, and run the application in a container. Verify
# that the application works correctly in the container and can communicate
# with other containers in your Docker network.

APP_IMG_NAME="my-legacy-app-image"

APP_CONTAINER_NAME="my-legacy-app-container"

docker build -t my-legacy-app .

docker run -d --name $APP_CONTAINER_NAME --network my-network $APP_IMG_NAME