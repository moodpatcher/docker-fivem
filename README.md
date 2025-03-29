An Alpine-based Docker image for running a FiveM server on Docker.

## Usage:

To use this image, run: ```docker pull moodpatcher/fivem:latest```

Docker CLI:

```bash 
docker run -it --rm --name fivem \
  -e KEY=changeme \
  -p 30120:30120/tcp \
  -p 30120:30120/udp \
  -p 40120:40120/tcp \
  -v ${PWD}/FXServer:/FXServer \
  --name fivem \
  --rm \
  moodpatcher/fivem:latest
```

Docker Compose:
```
services:
  fivem:
    image: moodpatcher/fivem:latest
    environment:
      - KEY=changeme
    ports:
      - "30120:30120/tcp"
      - "30120:30120/udp"
      - "40120:40120/tcp"
    volumes:
      - ${PWD}/FXServer:/FXServer

```
Docker Hub page: https://hub.docker.com/r/moodpatcher/fivem
