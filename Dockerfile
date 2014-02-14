FROM centos
MAINTAINER Marek Wywiał "onjinx@gmail.com"

ADD ./oracle-instantclient-basic-10.2.0.5-1.x86_64.rpm /tmp/oracle-instantclient-basic-10.2.0.5-1.x86_64.rpm
ADD ./oracle-instantclient-devel-10.2.0.5-1.x86_64.rpm /tmp/oracle-instantclient-devel-10.2.0.5-1.x86_64.rpm

RUN yum install -y postgresql php php-pgsql php-pear php-devel gcc make apache2 php-mbstring

RUN yum install -y /tmp/oracle-instantclient-basic-10.2.0.5-1.x86_64.rpm
RUN yum install -y /tmp/oracle-instantclient-devel-10.2.0.5-1.x86_64.rpm

RUN printf "\n" | pecl install oci8
RUN echo 'extension=oci8.so' >> /etc/php.ini

ENV APACHE_RUN_USER apache
ENV APACHE_RUN_GROUP apache
ENV APACHE_LOG_DIR /var/log/httpd

VOLUME ["/var/www/html"]

EXPOSE 80

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
