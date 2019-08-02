FROM python:3.6-slim
RUN apt-get clean \
    && apt-get -y update
RUN apt-get -y install \
    nginx \
    python3-dev \
    build-essential
COPY nginx.conf /etc/nginx/nginx.com
COPY . /app
WORKDIR /app
RUN pip install -r requirements.txt --src /usr/local/src
ENTRYPOINT ["python3"]
CMD ["uwsgi", "app.ini"]
