change localhost to gemini.club in /etc/hosts

Commands to run:

docker build -f Dockerfile_apache -t sub2 .

docker run -it --name gemini_a -p 80:80 --rm sub2

docker -it exec gemini_a bash

