# Usage: rund <container-image>
# Runs the specified container image as the current user, with the current directory mounted into the container.
function rund() {
  TEMP_HOME=$(mktemp --directory --quiet)
  trap 'rm -rf "TEMP_HOME"' EXIT

  docker run \
    --interactive \
    --tty \
    --user $(id -u):$(id -g) \
    --volume="/etc/group:/etc/group:ro" \
    --volume="/etc/passwd:/etc/passwd:ro" \
    --volume="/etc/shadow:/etc/shadow:ro" \
    --volume="$TEMP_HOME:/home/$USER" \
    --volume="/home/$USER/.gitconfig:/home/$USER/.gitconfig" \
    --volume="/home/$USER/.ssh:/home/$USER/.ssh:ro" \
    --volume "$PWD":/home/$USER/$(basename "$PWD") \
    --workdir /home/$USER/$(basename "$PWD") \
    --entrypoint /bin/bash \
    "$@"
}

# Usage: rund-root <container-image>
# Runs the specified container image as root, with the current directory mounted into the container.
# Running as root is more convenient if you want to install additional software into the container.
# Note that files created/modified from inside the container will be owned by the root user.
function rund-root() {
  docker run \
    --interactive \
    --tty \
    --user root \
    --volume "$PWD":/workdir/$(basename "$PWD") \
    --workdir /workdir/$(basename "$PWD") \
    --entrypoint /bin/bash \
    "$@"
}


