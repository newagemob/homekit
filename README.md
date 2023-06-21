# Homekit

***Pack-and-Go Media Server***

[Jellyfin]() + [Black Candy]() + [Sonarr]() + [Radarr]() + [Jackett]() + [Transmission]()


## Contents

* ***[Quick Start](#Quick-Start)***
* ***[Helpful Links](#Helpful-Links)***

# Quick Start

### 1. Install Docker and Docker Compose

#### Windows
```bash
# 1. Install Docker Desktop for Windows
curl -fsSL https://get.docker.com -o get-docker.sh
# 2. Install Docker Compose
pip install docker-compose
```

#### Linux
```bash
# 1. Install Docker
curl -fsSL https://get.docker.com -o get-docker.sh
# 2. Install Docker Compose

```

### 2. Clone this repo

```bash
git clone https://www.github.com/newagemob/homekit.git
```

or simply download the zip file and extract it.

### 3. Start the containers

**All images + containers are created via the `server/start_homekit.sh` script.**

```bash
cd server && chmod +x ./start_homekit.sh && ./start_homekit.sh
```

### 4. Access Apps

* Jellyfin: http://localhost:8096
* Black Candy: http://localhost:6969
* Sonarr: http://localhost:8989
* Radarr: http://localhost:7878
* Jackett: http://localhost:9117
* Transmission: http://localhost:9091

### 5. Add Media

You can add your media to the `media-server` directory in the corresponding "movies", "tv", or "music" folders. After you've added your media you can use the Jellyfin web interface to add the `media-server/movies` and `media-server/tv` folders as libraries. Be sure to set up your account and server accordingly.

You can use the Black Candy web interface to add the `media-server/music` folder as a library. Once you've created an account, go into *settings* and sync your music library.
