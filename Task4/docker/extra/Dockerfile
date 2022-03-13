FROM ubuntu:20.04

MAINTAINER elbrus.infosec@gmail.com

RUN apt-get update -y && apt-get install -y python3 python3-pip python3-dev

ENV DEVOPS="Elbrus"

COPY ./Task4/docker/extra/requirements.txt /app/requirements.txt

WORKDIR /app

RUN pip install -r requirements.txt

COPY ./Task4/docker/extra/app.py /app/app.py

CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]