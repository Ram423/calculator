FROM rainee/docker-alpine-oraclejdk8
COPY build/libs/ram423-0.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]
