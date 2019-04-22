---
id: docker
title: Docker
sidebar_label: Docker
---

# Docker useful commands

#### List all the images

`docker images`

#### List all the containers started

`docker ps`

#### List all the containers

`docker ps -a`

#### Start a container from an image (_detached mode_)

`docker run -d -p local-port:container-port ... <image_id>`

#### Enter a container (_SHELL_)

`docker exec -ti <container_id> bash`

#### Cleanup everything

`docker kill $(docker ps -qa) ; docker rm $(docker ps -qa) ; docker rmi $(docker images -qa)`

### Tips

If only one image. Then you can start a container from this image using:

`docker run -d -p local-port:container-port ... $(docker ps -qa)`

If only one container. Then you can enter it using:

`docker exec -ti <container_id> bash`

utils

Sauvegarder une image docker pour la partager
docker commit <container-id> <repository-name>
docker save --output <image-name>.tar <container-id>






