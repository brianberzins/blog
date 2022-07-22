# Usage: rund <container-image>
# Runs the specified container image as the current user, with the current directory mounted into the container.
function rund() {
  docker run \
    --interactive \
    --tty \
    --user $(id -u):$(id -g) \
    --workdir /home/$USER/$(basename "$PWD") \
    --entrypoint /bin/bash \
    --volume="/etc/group:/etc/group:ro" \
    --volume="/etc/passwd:/etc/passwd:ro" \
    --volume="/etc/shadow:/etc/shadow:ro" \
    --volume="/home/$USER/.gitconfig:/home/$USER/.gitconfig" \
    --volume "$PWD":/home/$USER/$(basename "$PWD") \
    $1
}