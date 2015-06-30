# Transmission for Raspberry Pi 2

This is a Dockerfile to set up [Transmission](https://www.transmissionbt.com/).

# Usage

```shell
$ docker run \
  -p 9091:9091
  -v /mnt/data:/data
  -v ./config:/config
  nunofgs/rpi-transmission
```
