FROM openjdk:20-slim-buster

RUN apt-get update && \
    apt-get install -y curl

RUN  mkdir /tmp/kafka && \
    curl "https://downloads.apache.org/kafka/3.3.1/kafka_2.13-3.3.1.tgz" \
    -o /tmp/kafka/kafka.tgz && \
    mkdir /kafka && cd /kafka && \
    tar -xvzf /tmp/kafka/kafka.tgz --strip 1

COPY start-kafka.sh  /usr/bin
RUN chmod +x  /usr/bin/start-kafka.sh

CMD ["start-kafka.sh"]