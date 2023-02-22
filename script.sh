#!/bin/bash
PS3="Enter your choice --->  "
echo "Script" 
select opt in startService stopService removeImage removeContainer actualStatus 
do
    case $opt in
        startService)
            docker build -t flask-python-app . &> /dev/null && docker run -dit -p 8080:8080 --name flask-python-app flask-python-app  2> /dev/null
            STATUS=$(docker exec -it flask-python-app ps | grep python)
            if [ -n "$STATUS" ]
            then
                echo "Docker image was build and the container is up"
            else
                echo "The proccess has failed, remove the container and try again."
            fi
            ;;

        stopService)
            docker exec flask-python-app kill 1
            if [ -n "$STATUS" ]
            then
                echo "Service has been stopped"
            else
                echo "Service has been stopped"
            fi
            ;;

        removeImage)
            docker image rm -f flask-python-app:latest
            iSTATUS=$(docker image ls)
            if [ -n "$iSTATUS" ]
            then
                echo "Image has been removed"
            else
                echo "Image has not been removed"
            fi
            ;;

        removeContainer)
            docker rm -f flask-python-app
            cSTATUS=$(docker ps)
            if [ -n "$cSTATUS" ]
            then
                echo "Container has been removed"
            else
                echo "Container has not been removed"
            fi
            ;;

        actualStatus)
            aSTATUS=$(docker exec -it flask-python-app ps | grep python)
            if [ -n "$aSTATUS" ] 
            then
                echo "Service is running!"
            else
                echo "Service is not running..."
            fi
            ;;


        *) echo "Choose between one of five above"
    esac
done




