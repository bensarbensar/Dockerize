FROM centos:7
MAINTAINER "Bens" <bensarbensar@gmail.com>

RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm \
    && rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm \
    && yum install -y git curl wget memcached unzip

RUN yum install -y \
    php70w \
    php70w-cli \
    php70w-common \
    php70w-devel \
    php70w-gd \
    php70w-intl \
    php70w-json \
    php70w-mbstring \
    php70w-mcrypt \
    php70w-mysqlnd \
    php70w-pdo \
    php70w-pear \
    php70w-xml \
    php70w-opcache \
    php70w-pecl-zip \
    php70w-pecl-memcached \
	php70w-pecl-redis \
	&& curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer 

RUN yum install -y httpd 

RUN mkdir /etc/httpd/vhosts && mkdir /var/www/html/source1 && mkdir /var/www/html/source2 && mkdir /var/www/html/source3 && mkdir /var/www/html/source4 && mkdir /var/www/html/source5 

COPY ./conf/httpd.conf /etc/httpd/conf

ENTRYPOINT ["/usr/sbin/httpd", "-D", "FOREGROUND"]