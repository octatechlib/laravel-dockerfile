
## Working with custom image

Building image and running a container for PHP7.4 app on Ubuntu 20.04 with pre-installed Laravel 7.x

## How to

### Steps 
Run

`docker build -t laravel-image . --no-cache` 

To check if image is there

`docker image ls`

If you want to run it in custom directory

`mkdir -p /project`

Otherwise

`docker run -d -v /$(pwd)/project:/var/www/html -p 80:80 --name laravel-container laravel-image`

Check

`docker ps`

Testing

`echo '<h1>Nginx and PHP-FPM 7.4 inside Docker Container with Ubuntu 20.04 Base Image</h1>' > /$(pwd)/project/index.html`

If you need to remove image, run

`docker rmi laravel-image`

install.sh makes container not exiting at the end. Adjust if you need to pre-install something.

To ender a container, run 

`docker exec -it -w /var/www/html/ laravel-container /bin/bash`

To open in browser

`http://127.0.0.1:80` or `http://my.laravel.local/`

## Troubles?
NOTE: remember that this directory has to be shared in docker desktop. If you get message
```
docker: Error response from daemon: Mounts denied: 
The path /project is not shared from the host and is not known to Docker.
You can configure shared paths from Docker -> Preferences... -> Resources -> File Sharing.
See https://docs.docker.com/docker-for-mac for more info.
```
means this directory is not shared.

If you experience
```
 Error response from daemon: OCI runtime create failed: container_linux.go:370: starting container process caused: exec: "./install.sh": permission denied: unknown.
```
you forgot --no-cache