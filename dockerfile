#FROM openjdk:11.0.10-jre-buster
FROM openjdk:20-slim-buster

RUN apt-get update && \
    apt-get install -y curl

RUN  mkdir /tmp/kafka && \
    curl "http://172.17.0.1:8000/kafka_2.13-3.3.1.tgz" \
    -o /tmp/kafka/kafka.tgz && \
    mkdir /kafka && cd /kafka && \
    tar -xvzf /tmp/kafka/kafka.tgz --strip 1

COPY start-kafka.sh  /usr/bin
RUN chmod +x  /usr/bin/start-kafka.sh

CMD ["start-kafka.sh"]