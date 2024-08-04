FROM openjdk:11

WORKDIR /usr/src/myapp

COPY ./build/libs/application-springboot*.jar ./application.jar
COPY ./dd-java-agent.jar ./dd-java-agent.jar

EXPOSE 8080

ENV DD_AGENT_HOST 10.99.233.226

# CMD [ "java", "-jar", "application.jar" ]
# java -javaagent:/dd-java-agent.jar -Ddd.profiling.enabled=true -XX:FlightRecorderOptions=stackdepth=256 -Ddd.logs.injection=true -Ddd.service=my-app -Ddd.env=staging -Ddd.version=1.0 -jar path/to/your/app.jar
CMD [ "java", "-javaagent:/usr/src/myapp/dd-java-agent.jar", "-Ddd.profiling.enabled=true", "-XX:FlightRecorderOptions=stackdepth=256", "-Ddd.logs.injection=true", "-Ddd.service=my-app", "-Ddd.env=staging", "-Ddd.version=1.0", "-jar", "/usr/src/myapp/application.jar" ]
