# mbentley/beammp-server

docker image for [BeamMP-Server](https://github.com/BeamMP/BeamMP-Server)
based off of mbentley/debian:bookworm

## Tags

For a list of tags, see [mbentley/beammp-server](https://hub.docker.com/r/mbentley/beammp-server/tags) on Docker Hub. I plan on keeping up to date with the official [BeamMP/BeamMP-Server releases](https://github.com/BeamMP/BeamMP-Server/releases).

* `3.4.0` - latest pre-release
* `latest`, `3.3.0` - latest release
* `3.2.2`

### Archived Tags

These tags are no longer actively built to patch security vulnerabilities:

* `3.2.0`
* `3.1.3`

To pull this image:
`docker pull mbentley/beammp-server`

## Usage

```bash
docker run -d \
  -p 30814:30814 \
  --name beammp-server \
  -v /data/beammp-server:/data \
  mbentley/beammp-server
```

## Building

To build an image:

```bash
docker build \
  --build-arg BMPS_VER="v3.2.2" \
  --build-arg ARTIFACT_NAME="BeamMP-Server.debian.12.x86_64" \
  -t mbentley/beammp-server:3.2.2 .
```

Older versions (`3.2.0` and `3.1.3`) had different artifact names so you need to substitute in `--build-arg ARTIFACT_NAME="BeamMP-Server-debian"`.
