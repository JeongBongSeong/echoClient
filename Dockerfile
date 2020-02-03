FROM eclipse/ubuntu_jdk8


ARG ZIP_FILE=/build/distributions/echoClient-0.0.1-SNAPSHOT.zip

USER root

RUN useradd -ms /bin/bash ksign
RUN echo "ksign:iotiot" | chpasswd
RUN adduser ksign sudo

ADD ${ZIP_FILE} /home/ksign/echoClient-0.0.1-SNAPSHOT.zip

USER ksign

RUN cd /home/ksign && unzip echoClient-0.0.1-SNAPSHOT.zip && rm echoClient-0.0.1-SNAPSHOT.zip
ENV JAVA_OPTS=""
CMD ["/home/ksign/echoClient-0.0.1-SNAPSHOT/bin/echoClient"]
