FROM openjdk:8-jre-slim-buster

WORKDIR /minecraft

RUN apt-get update \
	&& apt-get install -y --no-install-recommends curl unzip\
	&& curl https://servers.technicpack.net/Technic/servers/tekkitmain/Tekkit_Server_v1.2.9g-2.zip -o tekkit_server.zip \
	&& unzip tekkit_server.zip \
	&& rm tekkit_server.zip \
	&& chmod +x launch.sh

EXPOSE 25565/udp
EXPOSE 25565/tcp

CMD ["./launch.sh"]