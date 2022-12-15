# Homekit

***Pack-and-Go System for Data, Security, and Media***

***Homekit*** is based on [Kiwix](https://www.kiwix.org), [Home Assistant](https://github.com/home-assistant), and [Jellyfin](https://jellyfin.org/downloads/).

## Contents

* ***[Getting Started](#Getting-Started)***
* ***[Helpful Links](#Helpful-Links)***

# Getting Started

All pre-requisites are installed by the `install.sh` script.

**The only things you need to do:**

```bash
# 1. Clone this repo

git clone https://github.com/newagemob/homekit

# 2. Make the `install.sh` script executable

cd homekit
chmod +x ./install/install.sh

# 3. Run the script to install ***homekit*** from the base `homekit` directory. This is important because the script will use the current directory to make the `~/Developer` directory and move the `homekit` directory to it.

./install/install.sh
```

The `install.sh` script will take a while to run. It will install the following:

- Docker
- Docker Compose
- Home Assistant
- Jellyfin
- Kiwix

Everything will be installed in the `~/Developer/homekit` directory. The `install.sh` script will also create a `~/Developer/homekit/server` directory. This is where all of your app data and Docker bind-mounts will be stored. This includes:

- `~/Developer/homekit/server/jellyfin/media` - Movies, Music, TV Shows, etc.
- `~/Developer/homekit/server/homeassistant/config` - Home Assistant configuration files
- `~/Developer/homekit/server/kiwix/data` - Kiwix data files

These are just a few important directories to be aware of when transferring media and data to your ***homekit*** server.


# Helpful Links

[Docker and Docker Compose on Pi](https://dev.to/elalemanyo/how-to-install-docker-and-docker-compose-on-raspberry-pi-1mo)

