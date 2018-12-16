# OpenArena Docker Image

## Ports

Following ports need to be opened:
 - **80/TCP**: The ports where the client can download the files
 - **27950/udp**: OpenArena game port
 - **27960/udp**: OpenArena game port

## Environment variables

Following environment variables can be overwritten to ajust the image to your needs.

- **OA_NAME**: The name of the OpenArena server. Default is "OpenArena".
- **OA_WELCOME**: The welcome message of the OpenArena server. Default is "Welcome to OpenArena 0.8.8".
- **OA_PASSWORD**: The RCON password for the OpenArena server. Default is "1234".
- **OA_GAME_PORT**: The port to which the UDP port was mapped. Default is "27960".
- **OA_HTTP**: The address where OpenArena will download additional resources. The container offers the files under "/download". Default is "http://localhost/download".

## Directories

- /opt/openarena-0.8.8: Installation path
- /var/oa/home: Home directory for additional data. Can be mounted as volume. This files will be availiable as HTTP download
- /var/oa/provided: Provided extensions which will be linked to home dir during startup.

## Example

```bash
docker run -it --rm -p 80:80 -p 27950:27950/udp -p 27961:27960/udp -v /additional/content:/var/oa/home --name openarena mucer/openarena
```