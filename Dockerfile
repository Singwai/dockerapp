FROM resin/rpi-raspbian
RUN apt-get update && apt-get install -y git python vim \
        && curl --silent --show-error --retry 5 https://bootstrap.pypa.io/get-pip.py | python \
        && pip install Flask==0.11.1 redis==2.10.5
RUN useradd -ms /bin/bash admin
USER admin
COPY app /app
WORKDIR /app
CMD ["python", "app.py"]
