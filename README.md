# mbentley/beammp-server

docker image for [BeamMP-Server](https://github.com/BeamMP/BeamMP-Server)
based off of mbentley/debian:bookworm

## Tags

For a list of tags, see [mbentley/beammp-server](https://hub.docker.com/r/mbentley/beammp-server/tags) on Docker Hub. I plan on keeping up to date with the official [BeamMP/BeamMP-Server releases](https://github.com/BeamMP/BeamMP-Server/releases).

* `latest`, `3.4.1` - latest release

### Archived Tags

These tags are no longer actively built to patch security vulnerabilities:

* `3.4.0`
* `3.3.0`
* `3.2.2`
* `3.2.0`
* `3.1.3`

To pull this image:
`docker pull mbentley/beammp-server`

## Usage

### Running a basic container with persistent data

```bash
docker run -itd \
  --init \
  -p 30814:30814 \
  --name beammp-server \
  -v /data/beammp-server:/data \
  mbentley/beammp-server
```

### Server configuration with Environment Variables

There is an example `beammp-server.env` file which can be used to setup the server without having to directly modify the `ServerConfig.toml`

```bash
docker run -itd \
  --init \
  -p 30814:30814 \
  --name beammp-server \
  --env-file beammp-server.env \
  -v /data/beammp-server:/data \
  mbentley/beammp-server
```

You can also set environment variables as a part of the run command or combine them along with the env file. Env vars passed as a part of the run command will override what is in the config file. Here's an example of doing that, overriding the map:

```bash
docker run -itd \
  --init \
  -p 30814:30814 \
  --name beammp-server \
  --env-file beammp-server.env \
  -e BEAMMP_MAP="/levels/west_coast_usa/info.json" \
  -v /data/beammp-server:/data \
  mbentley/beammp-server
```

## Building

To build an image on your own:

```bash
docker build \
  --build-arg BMPS_VER="v3.4.1" \
  --build-arg ARTIFACT_NAME="BeamMP-Server.debian.12.x86_64" \
  -t mbentley/beammp-server:3.4.1 .
```

Older versions (`3.2.0` and `3.1.3`) had different artifact names so you need to substitute in `--build-arg ARTIFACT_NAME="BeamMP-Server-debian"`.
