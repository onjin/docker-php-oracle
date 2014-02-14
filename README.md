Contains
========

CentOS image with:

 * oracle-instantclient-basic-10.2.0.5-1.x86_64.rpm
 * oracle-instantclient-devel-10.2.0.5-1.x86_64.rpm
 * apache with mod_php 5.3


Install
-------

 * docker build -t php-oracle .

Usage
-----

 * docker run -v /full/path/to/your/php/code:/var/www/html -p 9999:80 php-oracle

Point your browser to:

 * http://127.0.0.1:9999/
