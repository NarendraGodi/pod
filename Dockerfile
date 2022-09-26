# start by pulling the python image
FROM ubuntu

# copy the requirements file into the image
RUN apt-get update && apt-get -y upgrade

RUN apt install apt-utils

RUN apt install -y python3 && apt install -y pip

RUN pip install Flask

RUN apt install -y git

RUN git clone https://github.com/NarendraGodi/pod.git

# switch working directory
WORKDIR /pod

ENTRYPOINT FLASK_APP=/pod/main.py --host=0.0.0.0
