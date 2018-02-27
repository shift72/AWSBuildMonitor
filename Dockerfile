FROM python:alpine

ENV SHELL=/bin/sh \
    FLASK_APP=/usr/src/app/app.py

RUN pip install pipenv

ADD Pipfile /usr/src/app/Pipfile
WORKDIR /usr/src/app

RUN pipenv install

ADD . /usr/src/app

EXPOSE 5000
CMD pipenv run gunicorn -w 1 -b 0.0.0.0:5000 --threads 1 app:app