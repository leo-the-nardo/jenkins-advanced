FROM jenkins/jenkins:lts
USER root
RUN apt update
RUN apt install -y lsb-release
## Install NodeJS & NPM
RUN curl -sL https://deb.nodesource.com/setup_20.x | bash -
RUN apt install -y nodejs

RUN curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc \
  https://download.docker.com/linux/debian/gpg
RUN echo "deb [arch=$(dpkg --print-architecture) \
  signed-by=/usr/share/keyrings/docker-archive-keyring.asc] \
  https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list
RUN apt-get update && apt-get install -y docker-ce-cli
RUN apt-get install -y python3-pip
RUN apt-get install -y python3
USER jenkins
RUN jenkins-plugin-cli --plugins "blueocean docker-workflow"