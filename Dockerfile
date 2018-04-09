FROM jenkinsci/blueocean:latest

USER root
RUN apk --no-cache add shadow
RUN usermod -aG docker jenkins
USER jenkins

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt