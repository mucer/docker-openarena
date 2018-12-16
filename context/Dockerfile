FROM node:11.4

# install needed packages
RUN apt-get update \
    && apt-get install -y curl unzip supervisor \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# install open arena
RUN curl -L -o /tmp/openarena-0.8.8.zip https://www.dropbox.com/s/eynm3cow8fml9b4/openarena-0.8.8.zip?dl=1 \
    && unzip /tmp/openarena-0.8.8.zip -d /opt -x "*.app/*" "*.exe" "*/__MACOSX/*" "*.dll" \ 
	&& rm -f /tmp/openarena-0.8.8.zip

# install extensions
RUN curl -L -o /tmp/oacmp-volume1-v3.zip https://www.dropbox.com/s/ort33tbeehni7fo/oacmp-volume1-v3.zip?dl=1 \
    && unzip /tmp/oacmp-volume1-v3.zip baseoa/* -d /opt/openarena-0.8.8 \
    && rm -f /tmp/oacmp-volume1-v3.zip

# default environment variables
ENV OA_NAME=OpenArena \
    OA_WELCOME="Welcome to OpenArena 0.8.8" \
	OA_PASSWORD=1234 \
	OA_GAME_PORT=27960 \
	OA_HTTP=http://localhost/download \
    NODE_ENV=production

# add files and install dependencies
ADD . /
RUN chmod +x /opt/*.sh \
    && (cd /www-data && npm ci)

# expose ports
EXPOSE 27950/udp 27960/udp 80/tcp

# run startup script
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf"]
