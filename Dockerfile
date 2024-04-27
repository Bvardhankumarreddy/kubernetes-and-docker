# Use Ubuntu 22.04 as the base image
FROM centos:latest

LABEL Author='Bhopathi Vardhan Kumar Reddy'
LABEL Email='bhopathivardhan654321@gmail.com'

# Update package lists and install required packages
RUN yum install -y httpd \
 zip\
 unzip\
 wget

# Set the working directory
WORKDIR /var/www/html/

# Download and extract the zip file
RUN wget https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip && \
    unzip photogenic.zip && \
    cp -rvf photogenic/* . && \
    rm -rf photogenic photogenic.zip

# Set the command to start Apache HTTP server
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

# Expose port 80
EXPOSE 80
