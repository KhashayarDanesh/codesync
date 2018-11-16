# Codesync

Based on [Dockage/Confd](https://github.com/dockage/confd)
A Docker image with a simple Script that keeps directories in sync with custom ownership and modes.

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