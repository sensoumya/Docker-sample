# FROM python:3.7.2-strech
# WORKDIR /app
# ADD . /app
# RUN pip install -r requirements.txt
# CMD ["uwsgi", "app.ini"]

FROM ubuntu:latest
RUN apt-get update -y
RUN apt-get install -y python3-pip python3-dev build-essential
COPY . /app
WORKDIR /app
RUN pip3 install -r requirements.txt
ENTRYPOINT ["python3"]
CMD ["uwsgi", "app.ini"]