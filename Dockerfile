FROM jenkins/jenkins:lts

# Копируем groovy-скрипт в папку инициализации Jenkins
COPY init.groovy.d/basic-security.groovy /usr/share/jenkins/ref/init.groovy.d/basic-security.groovy

# Делаем Jenkins пользователем с sudo
USER root
RUN apt-get update && apt-get install -y sudo
USER jenkins