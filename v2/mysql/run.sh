docker build -t mysql:v1 .
docker run -d --name mysql --network expense mysql:v1