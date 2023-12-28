# mbentley/beammp-server

docker image for [BeamMP-Server](https://github.com/BeamMP/BeamMP-Server)
based off of mbentley/debian:bookworm

For a list of tags, see [mbentley/beammp-server](https://hub.docker.com/r/mbentley/beammp-server/tags) on Docker Hub.

To pull this image:
`docker pull mbentley/beammp-server`

Example usage:

```
docker run -d \
  -p 30814:30814 \
  --name beammp-server \
  -v /data/beammp-server:/data \
  mbentley/beammp-server
```
