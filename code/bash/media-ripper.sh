function ripper() {
  docker run \
    --privileged \
    --interactive \
    --tty \
    --volume /shared-storage/disk-rips/config:/config:rw \
    --volume /shared-storage/disk-rips/rips:/out:rw \
    --device=/dev/sr0:/dev/sr0 \
    --device=/dev/sg0:/dev/sg3 \
    rix1337/docker-ripper:manual-latest
}