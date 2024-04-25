FROM ubuntu:22.04
LABEL Author = 'Bhopathi Vardhan Kumar Reddy'
LABEL Email = 'bhopathivardhan654321@gamil.com'
RUN apt-get update
RUN apt-get install -y apache2
RUN apt-get install -y zip \
unzip \
wget \
curl
WORKDIR /var/www/html/
RUN sudo curl -L https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip --output /var/www/hmtl/photogenic.zip
