FROM eclipse/ubuntu_jdk8
ARG JAR_FILE=/build/libs
ADD $(JAR_FILE)/echoClient-0.0.1-SNAPSHOT.jar /home/echoClient-0.0.1-SNAPSHOT.jar
ENV JAVA_OPTS=""
CMD ["java","-jar","/home/echoClient-0.0.1-SNAPSHOT.jar"]
