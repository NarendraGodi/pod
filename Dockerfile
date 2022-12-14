# start by pulling a base image.
FROM ubuntu
# update the repositories.
RUN apt-get update && apt-get -y upgrade
# Install apt utilities.
RUN apt install apt-utils
# Install Python and PIP.
RUN apt install -y python3 && apt install -y pip
# Install Flask Package for the execution of Flask Application.
RUN pip install Flask
# Install Git, as we will use it for cloning the source code.
RUN apt install -y git
# Clone the Git repository for the source code.
RUN git clone https://github.com/NarendraGodi/pod.git
# switch working directory
WORKDIR /pod
# Execute the application.
ENTRYPOINT FLASK_APP=/pod/main.py flask run --host=0.0.0.0 --port=8080
# make sure the container doesnt exit.
CMD tail -f /dev/null
