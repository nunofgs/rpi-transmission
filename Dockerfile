FROM resin/rpi-raspbian
MAINTAINER Nuno Sousa <nunofgs@gmail.com>

# Install transmission
ENV DEBIAN_FRONTEND noninteractive

# Install essential tools
RUN apt-get update && apt-get -qy --force-yes dist-upgrade
RUN apt-get install -y --no-install-recommends transmission-daemon curl

# Set home directory
RUN usermod -d /var/lib/transmission-daemon debian-transmission

# Clean up APT when done
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

VOLUME /config
VOLUME /data

EXPOSE 9091 51413/tcp 51413/udp

ENTRYPOINT ["transmission-daemon", "--foreground", "--log-error", "--auth", "--allowed", "*", "--config-dir", "/config"]
