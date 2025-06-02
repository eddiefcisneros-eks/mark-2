FROM ubuntu
RUN apt-get update && apt-get -y install python3.4
RUN apt install python3-pip -y
RUN pip install flask
RUN pip install flask-mysql
COPY . opt/source-code
ENTRYPOINT [ "FLASK_APP=/opt/source-code/app.py flask run" ]