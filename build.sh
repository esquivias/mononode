#!/bin/bash
#export ENV_DOCKERUSER=USERNAME
#export ENV_DOCKERPASS=$'PASSWORD'
echo "Mononode"
if [[ $* == *-push* ]]; then
    echo "1 of 2: Building"
else
    echo "1 of 1: Building"
fi
docker build -t mononode .
if [[ $* == *-push* ]]; then
    echo "2 of 2: Pushing"
    echo $ENV_DOCKERPASS | docker login --username $ENV_DOCKERUSER --password-stdin
    docker push $ENV_DOCKERUSER/mononode:latest
fi
exit 0