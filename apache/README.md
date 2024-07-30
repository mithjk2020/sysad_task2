change localhost to gemini.club in /etc/hosts

Commands to run:

docker build -f Dockerfile_apache -t sub2 .

docker run -it --name gemini_a -p 80:80 --rm sub2

now, open a another terminal window and run:
docker -it exec gemini_a bash

then inside the container run ./apache.sh


