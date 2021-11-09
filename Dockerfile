# set base image (host OS)
FROM python:3.8
RUN echo HTTP_PROXY = "http://10.232.233.70:8080/"
RUN echo HTTPS_PROXY = "http://10.232.233.70:8080/"

# set the working directory in the container
WORKDIR /code

# copy the dependencies file to the working directory
COPY requirements.txt .

# install dependencies
RUN pip install -r requirements.txt

# copy the content of the local src directory to the working directory
COPY src/ .

# command to run on container start
CMD [ "python", "./server.py" ]
