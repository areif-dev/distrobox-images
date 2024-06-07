#!/usr/bin/env bash 

usage() {
    echo "Usage: $0 <container-name> <new-image>"
}

if [ $# -lt 2 ]; then
    echo "An arugment is missing"
    usage
    exit 3
fi

if [ $# -gt 2 ]; then 
    echo "Too many arguments"
    usage
    exit 4
fi

container_name=$1
image_name=$2

# Check if a Distrobox exists for the given name 
checked_container_name=$(distrobox list | awk '{print $3}' | grep "^${container_name}$")
if [ -z "$checked_container_name" ]; then 
    echo "No Distrobox exists with name '$container_name'"
    exit 1
fi

home_dir=$(distrobox enter "$checked_container_name" -- printenv HOME 2> /dev/null)

distrobox stop --yes "$checked_container_name"
printf 'y\nn\n' | distrobox rm "$checked_container_name"
distrobox create --image "$image_name" --name "$checked_container_name" --home "$home_dir"
