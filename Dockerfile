FROM python:stretch

COPY . /app
WORKDIR /app

RUN pip install -r requirements.txt
RUN pip3 install -r requirements.txt

ENTRYPOINT [ "gunicorn", "-b", "0.0.0.0:8080", "main:APP" ]