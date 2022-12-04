# install docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# add the user to the docker group
sudo usermod -aG docker $USER

# install docker compose
sudo apt-get install -y libffi-dev libssl-dev
sudo apt-get install -y python3 python3-pip
sudo apt-get remove python-configparser
sudo pip3 -v install docker-compose
