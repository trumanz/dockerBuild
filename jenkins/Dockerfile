FROM  trumanz/ubuntu14.04-dev

#ADD  apt.conf  /etc/apt/
RUN 

RUN wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
RUN sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
RUN sudo apt-get update
RUN sudo apt-get install -y jenkins
RUN sudo apt-get install -y git

