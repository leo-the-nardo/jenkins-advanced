# THIS SCRIPT RUNS ON HOST MACHINE (NOT INSIDE CONTAINER)
sudo apt update
sudo apt install docker.io -y
USERNAME=$(whoami)
sudo usermod -aG docker "$USERNAME"
newgrp docker
docker run --name "jenkins" -p 8080:8080 -p 50000:50000 -d  \
-v jenkins_home:/var/jenkins_home \
-v /var/run/docker.sock:/var/run/docker.sock \
-v $(which docker):/usr/bin/docker \
jenkins/jenkins:lts
## to jenkins user have permission to use docker on pipelines
chmod 666 /var/run/docker.sock

#docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword