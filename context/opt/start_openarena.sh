#!/bin/bash

OA_HOME=/opt/openarena-0.8.8
USER_HOME=/var/oa/home
GAME_MODE=baseoa

mkdir -p $USER_HOME

cat > $OA_HOME/$GAME_MODE/settings.cfg <<EOL
set dedicated 1
set sv_hostname "${OA_NAME}"
set g_motd "${OA_WELCOME}"
set net_port "${OA_GAME_PORT}"
set rconpassword "${OA_PASSWORD}"
set sv_dlURL "${OA_HTTP}"
EOL

$OA_HOME/oa_ded.x86_64 +set fs_homepath $USER_HOME +exec settings.cfg +exec "server1.cfg"
