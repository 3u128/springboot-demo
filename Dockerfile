FROM openjdk:17
COPY target/*.jar demo.jar
ENTRYPOINT ["java","-jar","/demo.jar"]