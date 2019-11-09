FROM openjdk:8-jre-slim-buster

RUN apt-get update \
	&& apt-get install -y curl unzip\
	&& mkdir /minecraft \
	&& cd /minecraft \
	&& curl http://servers.technicpack.net/Technic/servers/tekkitmain/Tekkit_Server_v1.2.9g.zip -o tekkit_server.zip \
	&& unzip tekkit_server.zip \
	&& rm tekkit_server.zip \
	&& chmod +x launch.sh

EXPOSE 25565 25565/udp

WORKDIR /minecraft
CMD ["./launch.sh"]