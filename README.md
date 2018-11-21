# Codesync

Based on [Dockage/Confd](https://github.com/dockage/confd)
A Docker image with a simple Script that keeps directories in sync with custom ownership and modes.

[![Docker Pulls](https://img.shields.io/docker/pulls/kdanesh/codesync.svg)](https://hub.docker.com/kdanesh/codesync) [![Docker Stars](https://img.shields.io/docker/stars/kdanesh/codesync.svg?style=flat)](https://hub.docker.com/r/kdanesh/codesync) [![Docker Build Status](https://img.shields.io/docker/build/kdanesh/codesync.svg)](https://hub.docker.com/r/kdanesh/codesync) [![Docker Automated build](https://img.shields.io/docker/automated/kdanesh/codesync.svg)](https://hub.docker.com/r/kdanesh/codesync)


## What does this image exactly do

Takes a source folder and watches for changes with `inotify` package, then syncs the content to destination folder with desired ownership and modes.

## How Does it Work

All the configuration is passed to confd via environment variables, confd reads the environment variables and generates the script, then the command is run and the sync begins, the process happens with `inotify`, reporting for changes and rsync for doing the sync.
You can change how the script works by modifying `assets/root/etc/confd/templates/codesync.sh.tmpl`,
all confd does is generate the script in a directory with configured modes and ownership. you can have a loot at the configuration here : `assets/root/etc/confd/conf.d`

Syncs are Bi-Directional with current script.
Also the configuration is passed via a json, you can add the following block to the end of `SYNC_BLOCK_JSON` environment variable in docker-compose file and get as many sources and destinations in sync as you want.
```json
{"name": "project_a","source": "/project_a_source","target": "/project_a_target","owner_and_group": "1000:1000","access_modes": "755","interval": "2"}
```

for getting the image you can simply run `docker pull kdanesh/codesync`.

also there's a sample docker-compse wich you can get up and running with typing 
`docker-compose up -d` in project folder or if you want the image itself you can have a look at its page in [Dockerhub/kdanesh](https://hub.docker.com/r/kdanesh/codesync/)
