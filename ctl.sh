#!/bin/bash -e

function init (){
    echo "ERROR: init is not implemented for this service. Aborting!"
    exit 1
}

if [[ -z "$1" || "$1" == "help" ]]; then
    script_name="$(basename "$0")"
    echo -e "Control script for docker-compose services\n"
    echo -e "Usage: ${script_name} <command>\n"
    echo "Commands:"
    echo -e "\tstart\t\tStarts all services"
    echo -e "\tstop\t\tStops all services"
    echo -e "\trestart\t\tRestart all services"
    echo -e "\treset\t\tStops and Starts all services"
    echo -e "\tlogs\t\tShows the docker logs"
    echo -e "\tstatus\t\tShows the services status"
    echo -e "\tinit\t\tInitializes the volumes and copies configuration files to the volumes.\n\t\t\tThis is only needed the first time!"
    echo -e "\thelp\t\tShows this help page"
    
elif [[ "$1" == "start" ]]; then
    docker-compose up -d
elif [[ "$1" == "stop" ]]; then
    docker-compose down
elif [[ "$1" == "restart" ]]; then
    docker-compose restart
elif [[ "$1" == "reset" ]]; then
    docker-compose down && docker-compose up -d
elif [[ "$1" == "logs" ]]; then
    docker-compose logs -f
elif [[ "$1" == "status" ]]; then
    docker-compose ps
elif [[ "$1" == "init" ]]; then

    if [[ -d volumes/ ]]; then
        echo "ERROR: volumes already exists. Aborting!"
        exit 1
    else 
        init
    fi
else 
    echo "ERROR: Command $1 not found. Aborting!"
    echo "Use help for more informations"
    exit 1
fi

exit 0
