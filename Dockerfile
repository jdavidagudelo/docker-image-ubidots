# python 2.7.12 image
FROM python:2.7.12

ADD ./src src

# install all needed packages

RUN apt-get update

RUN apt-get --yes install python-dev libpng12-0 libpng12-dev libjpeg62 libjpeg62-turbo-dev libopenjpeg-dev libblas-dev liblapack-dev gfortran redis-server postgresql rabbitmq-server mongodb libxslt1-dev libcairo2-dev libpango1.0-dev libpq-dev libffi-dev libgeos-dev python-virtualenv

RUN virtualenv Ubidots
RUN chmod 755 Ubidots/bin/activate
RUN . Ubidots/bin/activate && pip install -U tox && pip install nodeenv && pip install -r src/requirements_django1.9.pip

CMD ["bin/bash"]
