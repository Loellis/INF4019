#! /bin/bash

#Main
for item in $(docker ps -a | awk '{print $1}')
do
	if [[ $item == "CONTAINER" ]]
	then
		continue

	elif [[ $(docker inspect --format='{{.Name}}' $item) == *"webserver"* ]]
	then
		echo "Found webserver already running."
		echo "Stopping and removing node."
		docker stop $item
		docker rm $item
	else
		continue
	fi
done

#Building new webserver
docker run -dit -p 39001:80 --name webserver loellis/website:v1
docker cp index.html webserver:/var/www/index.html
docker cp style.css webserver:/var/www/style.css
