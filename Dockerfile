FROM openjdk:11-jdk
RUN mkdir /app
COPY gradle-sourcecode-demo/build/libs/gradle-sourcecode-demo-0.0.1.jar /app/gradle-sourcecode-demo.jar
ENTRYPOINT ["java","-jar","/app/gradle-sourcecode-demo.jar"]