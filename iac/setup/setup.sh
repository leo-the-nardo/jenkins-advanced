sudo apt update
sudo apt install docker.io -y
USERNAME=$(whoami)
sudo usermod -aG docker "$USERNAME"
newgrp docker
docker run --name "jenkins" -p 8080:8080 -p 50000:50000 -d -v jenkins_home:/var/jenkins_home jenkins/jenkins:lts
docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword