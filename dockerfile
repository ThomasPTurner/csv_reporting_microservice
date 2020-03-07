FROM ubuntu:18.04
RUN apt-get update
RUN apt-get install python3-pip -y
RUN pip3 install gunicorn
WORKDIR /csv_reporting/
COPY . /csv_reporting/
CMD gunicorn --bind 0.0.0.0:8000 server:app