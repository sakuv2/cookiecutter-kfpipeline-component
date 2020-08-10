#!/bin/sh

PREFFIX="{{cookiecutter.image_preffix}}"
IMAGE_TAG=$(awk -F'[ ="]+' '$1 == "version" { print $2 }' pyproject.toml)
NAME=$(awk -F'[ ="]+' '$1 == "name" { print $2 }' pyproject.toml)

image_name=${PREFFIX}/${NAME}
full_image_name=${image_name}:${IMAGE_TAG}

cd "$(dirname "$0")"

docker build -t "$full_image_name" .
docker push "$full_image_name"