

docker run -d -p 3306:3306 \
   -e MYSQL_ROOT_PASSWORD=root \
   -v mydata:/var/lib/mysql \
   mysql:8.0

docker run -d -p 8080:80 \
   --name web \
   --network mynet \
   nginx:1.25

docker run -ti --rm \
   --network mynet \
   nicolaka/netshoot /bin/sh