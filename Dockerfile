# pull official base image
FROM ubuntu:22.04

# set work directory
WORKDIR /spark-stream-api

RUN apt update -y
RUN apt-get install iputils-ping -y
RUN apt install -y python3-pip
RUN apt install default-jre-headless -y
# RUN apt install maven -y

# RUN git clone https://github.com/RedisLabs/spark-redis.git
# WORKDIR /spark-redis
# RUN mvn clean package -DskipTests

# install dependencies
RUN pip install --upgrade pip
COPY ./requirements.txt .
RUN pip install -r requirements.txt

# EXPOSE 9001

# ENV KAFKA_HOST=localhost:9092

COPY . /spark-stream-api


CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "9001"]
