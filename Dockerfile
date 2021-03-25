FROM python:stretch

RUN mkdir /app
COPY . /app
WORKDIR /app

RUN pip install -r requirements.txt
RUN pip3 install -r requirements.txt

EXPOSE 8080

ENTRYPOINT [ "gunicorn", "-b", "0.0.0.0:8080", "main:APP" ]