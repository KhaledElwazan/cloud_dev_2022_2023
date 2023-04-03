```bash

# Create a Docker image from a Dockerfile that installs and runs a simple web
# application (such as Apache or Nginx) on port 80. Verify that the web
# application is accessible from a web browser on your host machine.


# Set up file and image names
IMG_DIR=nginx_img
IMG_NAME=my-nginx

# Build Docker image for NGINX
docker build -t my-nginx ${IMG_DIR}/.


# Run NGINX container and map port 8080 to port 80
docker run -d -p 8080:80 ${IMG_NAME}


# Verify that the web server is accessible by navigating to http://localhost:8080 in a web browser.

```