FROM ubuntu:22.04

LABEL Author='Bhopathi Vardhan Kumar Reddy'
LABEL Email='bhopathivardhan654321@gamil.com'

RUN apt-get update && \
    apt-get install -y httpd && \
    apt-get install -y zip \
                       unzip \
                       wget \
                       curl && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /var/www/html/

RUN wget https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip && \
    unzip photogenic.zip && \
    cp -rvf photogenic/* . && \
    rm -rf photogenic photogenic.zip

# Set ServerName to suppress the warning message
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

CMD ["apache2ctl", "-D", "FOREGROUND"]

EXPOSE 80
