FROM ubuntu:22.04
LABEL Author = 'Bhopathi Vardhan Kumar Reddy'
LABEL Email = 'bhopathivardhan654321@gamil.com'
RUN apt-get update
RUN apt-get install -y apache2
RUN apt-get install -y zip \
unzip
WORKDIR /var/www/html/
ADD https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip /var/www/html/
RUN unzip photogenic.zip
RUN cp -rvf photogenic/* 


