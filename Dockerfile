FROM jpetazzo/dind
MAINTAINER defermat@defermat.net

# use identity auth version of docker
RUN wget https://bfirsh.s3.amazonaws.com/docker/linux/docker-1.3.1-dev-identity-auth
RUN chmod +x docker-1.3.1-dev-identity-auth
RUN mv /usr/bin/docker /usr/bin/docker-stable
RUN mv docker-1.3.1-dev-identity-auth /usr/bin/docker

# add machine
RUN wget https://github.com/docker/machine/releases/download/0.0.1/linux
RUN chmod +x linux
RUN mv linux /usr/bin/machine

# Define additional metadata for our image.
VOLUME /var/lib/docker
CMD ["wrapdocker"]
