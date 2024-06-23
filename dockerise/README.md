Copy the dockerfile to /task folder(with reference to task 1)

cd into /task and run the following:

docker build -t delta_server .

docker run -d -p 80:80 -p 443:443 --name gemini delta_server

docker exec -it gemini bash
