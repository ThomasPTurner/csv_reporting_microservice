FROM ubuntu:18.04
RUN apt-get update
RUN apt-get install python3-pip -y
RUN pip3 install flask
WORKDIR /csv_reporting/
COPY . /csv_reporting/
ENV FLASK_APP=flask_server.py
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8
ENV FLASK_DEBUG=1
CMD flask run --host 0.0.0.0