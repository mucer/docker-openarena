#!/bin/bash
sourceDir=/var/op/provided/baseoa
targetDir=/var/oa/home/baseoa

# Lists external pk3 files and make symbolic links in the server's folder 
mkdir -p $targetDir

for file in "$sourceDir/*.pk3"; do
	[ -e "$file" ] || continue
	echo "[INFO] Found file $file, adding it to server"
	ln -s $file $targetDir
done

exec @*