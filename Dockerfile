FROM python:3.8.10-alpine

WORKDIR /

COPY app/ .

RUN pip install Flask

EXPOSE 8080

CMD [ "python3", "server.py" ]