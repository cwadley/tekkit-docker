# tekkit-docker
### Tekkit server in a docker container!

## Usage
`docker run -d -p 25565:25565 -p 25565:25565/udp cwadley/tekkit-docker:latest`
This will run the default configuration, which does not include any custom server configurations.

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

If you would like to run the server with custom configurations, you can volume mount the appropriate files:
`docker run -d -p 25565:25565 -p 25565:25565/udp -v <path_to_server.properties>:/minecraft/server.properties cwadley/tekkit-docker:latest`

For more information on how to configure these files, refer to the Minecraft and Tekkit documentation.

**Warning**
If you neither volume mount a custom world directory, nor mount the existing world directory to a named docker volume, the world will be lost when the container is destroyed.

If you would like to save the world created by the server, ensure to run the container with the world directory saved to a named volume:
`docker run -d -p 25565:25565 -p 25565:25565/udp -v tekkit-data:/minecraft/world cwadley/tekkit-docker:latest`