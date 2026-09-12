docker build -t backend:v1 .
docker run -d --name backend --network expense backend:v1