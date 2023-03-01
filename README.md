# tekkit-docker: a containerized Tekkit server

## Usage

To start the server run `docker-compose up -d` 

The server will be accessible at `<docker-host-ip>:25565` and the world folder will be copied to a `world` directory in the same folder as `docker-compose.yml`. The default server properties are provided, to run the server with custom server properties edit `server.properties`. This file must exist on the host otherwise docker compose cannot mount it to the container.


For more control over configuration: 

1) Build the image: `docker image build . -t tekkit`
2) Run the server: `docker run -d -p 25565:25565 -p 25565:25565/udp tekkit` or `docker run -d -25565:25565 -p 25565:25565/udp -v ./world:/minecraft/world tekkit` to persist the world.

The latest Tekkit server uses Minecraft server version 1.6.4. Ensure you are using a compatible client to access the server.

## Advanced Usage
The server files reside in `/minecraft`. These files include the following configuration and data files:
* server.properties
* banned_ips.txt
* banned_users.txt
* ops.txt
* white-list.txt
* config directory
* world directory

For more information on how to configure these files, refer to the Minecraft and Tekkit documentation.

**Warning**
If you neither volume mount a custom world directory, nor mount the existing world directory to a named docker volume, the world will be lost when the container is destroyed. If you would like to save the world created by the server, ensure to run the container with the world directory saved to a named volume.

Alternatively, use `docker-compose up -d` and docker compose will manage volumes for you.