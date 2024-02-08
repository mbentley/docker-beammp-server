# rebased/repackaged base image that only updates existing packages
FROM mbentley/debian:bookworm
LABEL maintainer="Matt Bentley <mbentley@mbentley.net>"

ARG DEBIAN_FRONTEND=noninteractive
ARG BMPS_VER
ARG ARTIFACT_NAME="BeamMP-Server.debian.12.x86_64"

# install BeamMP-Server & dependencies
RUN apt-get update &&\
  apt-get install --no-install-recommends -y ca-certificates jq liblua5.3-0 libssl3 wget &&\
  BMPS_VER=$(if [ -z "${BMPS_VER}" ]; then wget -q -O - https://api.github.com/repos/BeamMP/BeamMP-Server/releases/latest | jq -r .tag_name; else echo "${BMPS_VER}"; fi) &&\
  apt-get purge -y jq &&\
  apt-get autoremove -y &&\
  rm -rf /var/lib/apt/lists/* &&\
  mkdir -p /data &&\
  wget -q -O /usr/local/bin/BeamMP-Server "https://github.com/BeamMP/BeamMP-Server/releases/download/${BMPS_VER}/${ARTIFACT_NAME}" &&\
  chmod +x /usr/local/bin/BeamMP-Server &&\
  groupadd -g 516 beammp-server &&\
  useradd -u 516 -g 516 -d /data beammp-server &&\
  chown -R beammp-server:beammp-server /data

USER beammp-server
WORKDIR /data
VOLUME /data
EXPOSE 30814
CMD ["/usr/local/bin/BeamMP-Server"]
