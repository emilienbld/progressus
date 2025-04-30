FROM nginx
RUN apt update && apt install net-tools iproute2 uiputils-ping ssh vim -y
COPY . /var/lib/nginx/html
