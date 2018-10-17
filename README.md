docker-sencha-cmd
=================

Docker image to run Sencha Cmd for gitlab-ci

Usage:

docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -v $(pwd):/mnt --workdir /mnt docker pull a1iante/sencha app build
