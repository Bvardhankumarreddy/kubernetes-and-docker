FROM ubuntu:22.04

LABEL Author='Bhopathi Vardhan Kumar Reddy'
LABEL Email='bhopathivardhan654321@gamil.com'

RUN apt-get update && \
    apt-get install -y httpd && \
    apt-get install -y zip \
                       unzip \
                       wget 

WORKDIR /var/www/html/

RUN wget https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip && \
    unzip photogenic.zip && \
    cp -rvf photogenic/* . && \
    rm -rf photogenic photogenic.zip



CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

EXPOSE 80
