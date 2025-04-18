FROM jenkins/jenkins:lts

# Копируем groovy-скрипт в папку инициализации Jenkins
COPY init.groovy.d/basic-security.groovy /usr/share/jenkins/ref/init.groovy.d/basic-security.groovy

# Делаем Jenkins пользователем с sudo
USER root
RUN apt-get update && apt-get install -y sudo
USER jenkins

# Открываем порт 8080 для HTTP
EXPOSE 8080

# Стартовая команда для запуска Jenkins
CMD ["java", "-jar", "/usr/share/jenkins/jenkins.war", "--httpPort=8080"]