# pull official base image
FROM ubuntu:22.04

# set work directory
WORKDIR /usr/src/app

RUN apt update -y
# RUN apt install -y python3
RUN apt install -y python3-pip
RUN apt install default-jre -y
# RUN apt install default-jdk -y

# install dependencies
RUN pip install --upgrade pip
COPY ./requirements.txt .
RUN pip install -r requirements.txt

# EXPOSE 9001

# copy project
COPY . .

# CMD [ "uvicorn", "app:app", "--reload", "--host", "127.0.0.1", "--port", "9001" ]