# create the network
docker network create mynet

# create a volume for the data
docker volume create myvol

# create the database
# give it a name
# do not port bind, use the volume, run inside mynet
docker run -d \
   -v myvol:/var/lib/mysql \
   --network mynet \
   --name mydb \
   stackupiss/northwind-db:v1

# create the application
# run inside mynet, connect to mydb
# set environment variable DB_HOST, DB_USER, DB_PASSWORD
# port bind
docker run -d -p 8080:3000 \
   --network mynet \
   --name myapp \
   -e DB_HOST=mydb \
   -e DB_USER=root \
   -e DB_PASSWORD=changeit \
   stackupiss/northwind-app:v1