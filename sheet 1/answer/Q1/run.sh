# Create a Docker image from a Dockerfile that installs and runs a simple web
# application (such as Apache or Nginx) on port 80. Verify that the web
# application is accessible from a web browser on your host machine.



IMG_DIR=nginx_img
IMG_NAME=my-nginx

docker build -t my-nginx ${IMG_DIR}/.

docker run -d -p 8080:80 ${IMG_NAME}


# Verify that the web server is accessible by navigating to http://localhost:8080 in a web browser.