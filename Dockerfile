# pull official base image
FROM ubuntu:22.04

# set work directory
WORKDIR /spark-stream-api

RUN apt update -y
RUN apt install -y python3-pip
RUN apt install openjdk-11-jre-headless -y

# install dependencies
RUN pip install --upgrade pip
COPY ./requirements.txt .
RUN pip install -r requirements.txt

# EXPOSE 9001

COPY . /spark-stream-api


# CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "9001"]
