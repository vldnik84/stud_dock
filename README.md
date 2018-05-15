### MindK S.P.A. Course sample Docker environment

Created as an example for S.P.A. Course listeners

*(c) 2018 vldnik84*

### Installation and setup
- Install Docker and Docker Compose following the instruction provided below
- Download and deploy this docker configuration to your local machine
- Set up your configuration within **docker-compose.yml** and **apache/Dockerfile** files
- Change **/etc/hosts** according to your apache configuration
- Run ```./restart.sh``` from this folder under console to start Docker Compose environment
- Visit your application URLs in your browser


----------------------------------------------------------------------------
// Install Docker
----------------------------------------------------------------------------
sudo apt-get update
----------------------------------------------------------------------------
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
----------------------------------------------------------------------------
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
----------------------------------------------------------------------------
// For Ubuntu 18.04 choose EDGE release
----------------------------------------------------------------------------
// STABLE release
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

// EDGE release
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   edge"
----------------------------------------------------------------------------
sudo apt-get update
----------------------------------------------------------------------------
sudo apt-get install docker-ce
----------------------------------------------------------------------------


----------------------------------------------------------------------------
// Install Docker Compose (check its latest version before proceeding)
----------------------------------------------------------------------------
sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
----------------------------------------------------------------------------
sudo chmod +x /usr/local/bin/docker-compose
----------------------------------------------------------------------------
// Test Docker Composer
----------------------------------------------------------------------------
docker-compose --version
----------------------------------------------------------------------------
// Add User username to Group docker
----------------------------------------------------------------------------
sudo usermod -a -G docker username
----------------------------------------------------------------------------
// Restart Computer
----------------------------------------------------------------------------