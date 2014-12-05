machine
=======

Run Docker Machine inside of a Docker container

Leverages Docker-in-Docker, and as such, works the same way.

There is only one requirement: your Docker version should support the
`--privileged` flag.


## Quickstart

Build the image:

```
docker build -t machine .
```

Run Machine on Docker-in-Docker and get a shell where you can play, and docker daemon logs
to stdout:

```
docker run --privileged -t -i machine
```

Run Machine on Docker-in-Docker and get a shell where you can play, but docker daemon logs
into `/var/log/docker.log`:

```
docker run --privileged -t -i -e LOG=file machine
```

Run Machine on Docker-in-Docker and expose the inside Docker to the outside world:

```
docker run --privileged -d -p 4444 -e PORT=4444 machine
```

Note: when started with the `PORT` environment variable, the image will just
the Docker daemon and expose it over said port. When started *without* the
`PORT` environment variable, the image will run the Docker daemon in the
background and execute a shell for you to play.

### Daemon configuration

You can use the `DOCKER_DAEMON_ARGS` environment variable to configure the
docker daemon with any extra options:

```
docker run --privileged -d -e DOCKER_DAEMON_ARGS="-D" machine
```
