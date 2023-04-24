## Question 1

Create a Docker network and launch multiple containers connected to it. Verify that the containers can communicate with each other over the network.

## Solution

1)  Create a Docker network called `my-awesome-network` using the `docker network create` command.

```bash
docker network create my-awesome-network 
```


2) Run two containers connected to the network:

```bash
docker run -d --name container1 --network my-awesome-network  nginx
docker run -d --name container2 --network my-awesome-network  nginx

```

3) Verify that the containers can communicate with each other by executing the
following command in one of the containers:

```bash
curl container2
```