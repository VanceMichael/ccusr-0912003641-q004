FROM maven:3.9.9-eclipse-temurin-21-alpine AS build
WORKDIR /src
COPY .mvn ./.mvn
COPY pom.xml .
RUN mvn -q -B dependency:go-offline
COPY src ./src
RUN mvn -q -B package -DskipTests

FROM build AS test
RUN mvn -q -B test
CMD ["mvn", "-q", "-B", "test"]

FROM eclipse-temurin:21-jre-alpine AS runtime
RUN addgroup -S service && adduser -S service -G service
USER service
COPY --from=build /src/target/cell-therapy-trace.jar /service.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/service.jar"]
