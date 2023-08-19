FROM openjdk:11

WORKDIR /usr/src/myapp

COPY ./build/libs/application-springboot*.jar ./application.jar

EXPOSE 8080

CMD [ "java", "-jar", "application.jar" ]
