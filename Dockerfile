FROM openjdk:11
COPY target/*.jar demo.jar
ENTRYPOINT ["java","-jar","/demo.jar"]
