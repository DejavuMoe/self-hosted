#!/bin/bash

set -e

echo -e "This script will help you quickly deploy Plausible using Docker Compose\nAuthor: Dejavu Moe\nPost:https://dejavu.moe/posts/plausible-selfhosted-with-docker-complete-guide/"
read -p "Press Enter to continue..." enter

if [[ "$(command -v docker)" == "" && "$(command -v docker compose)" == "" ]]; then
  echo "Docker and the Docker Compose plugin are not installed on your machine, aborted!"
  exit 1
else
  echo "Start deployment process"
fi

echo "Plausible The relevant persistent data will be stored in $(pwd)/container/plausible/"

if [ -d container ]; then
    echo "The container folder already exists in the current directory, skip creating the folder"
else
    mkdir container
    echo "The container folder has been created"
fi

cd container
git init
git remote add origin https://git.xvo.es/self-hosted.git
git config --local core.sparsecheckout true
echo "plausible" >> .git/info/sparse-checkout
git pull --depth=1 origin master
cd plausible
echo "Downloading geonames.csv.database..."
wget https://s3.eu-central-1.wasabisys.com/plausible-application/geonames.csv -P GeoIP/
echo -e "The environment required for Plausible has been initialized\nPlease complete the environment variables\nAfterwards, use the following command in the current directory to complete the deployment\nsudo docker compose up -d\nPress any key to exit..."
read -n 1 -s -r -p ""
exit 0