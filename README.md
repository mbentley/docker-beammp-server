# mbentley/beammp-server

docker image for [BeamMP-Server](https://github.com/BeamMP/BeamMP-Server)
based off of mbentley/debian:bullseye

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
