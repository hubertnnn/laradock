#!/bin/bash

# Update this values with your setup
# You can add more folders, just make sure to add lines in "Setup NFS" code below as well
MACHINE_NAME=docker-default
SHARED_FOLDER_1=/mnt/projects
SHARED_FOLDER_2=/home/$(whoami)/projects


# Switch folder
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

# Create machine
docker-machine create --driver=virtualbox --virtualbox-hostonly-cidr "10.10.10.1/24" $MACHINE_NAME

# Setup NFS
./docker-machine-nfs/docker-machine-nfs.sh $MACHINE_NAME -f --nfs-config="(rw,no_subtree_check,crossmnt,all_squash,anonuid=1000,anongid=1000)" \
    --shared-folder=$SHARED_FOLDER_1 \
    --shared-folder=$SHARED_FOLDER_2 \

# Export docker .env variables
eval $(docker-machine env $MACHINE_NAME)

# Show IP of VM
docker-machine ip $MACHINE_NAME
