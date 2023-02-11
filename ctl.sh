#!/bin/bash -e

function init (){
    echo "ERROR: init is not implemented for this service. Aborting!"
    exit 1
}

if [[ -z "$1" || "$1" == "--help" ]]; then
    script_name="$(basename "$0")"
    echo "Control script for services"
    echo "Usage: ${script_name}"
    echo -e "\t--start\t\tStarts all services"
    echo -e "\t--stop\t\tStops all services"
    echo -e "\t--soft-restart\tRestart all services"
    echo -e "\t--hard-restart\tStops and Starts all services"
    echo -e "\t--logs\t\tShows the docker logs"
    echo -e "\t--status\tShows the service status"
    echo -e "\t--init\t\tInitializes the volumes and copies configuration files to the volumes.\n\t\t\tThis is only needed the first time!"
    echo -e "\t--help\t\tShows this help page"
    
elif [[ "$1" == "--start" ]]; then
    docker-compose up -d
elif [[ "$1" == "--stop" ]]; then
    docker-compose down
elif [[ "$1" == "--soft-restart" ]]; then
    docker-compose restart
elif [[ "$1" == "--hard-restart" ]]; then
    docker-compose down && docker-compose up -d
elif [[ "$1" == "--logs" ]]; then
    docker-compose logs -f
elif [[ "$1" == "--status" ]]; then
    docker-compose ps
elif [[ "$1" == "--init" ]]; then

    if [[ -d volumes/ ]]; then
        echo "ERROR: volumes already exists. Aborting!"
        exit 1
    else 
        init
    fi
else 
    echo "ERROR: Command $1 not found. Aborting!"
    echo "Use --help for more informations"
    exit 1
fi

exit 0
