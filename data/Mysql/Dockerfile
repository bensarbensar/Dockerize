FROM centos:7
MAINTAINER "Bens" <bensarbensar@gmail.com>

ENV container docker
RUN yum update -y
RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == \
systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;
VOLUME [ "/sys/fs/cgroup" ]
CMD ["/usr/sbin/init"]


#ADD REPO
RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm
RUN yum install -y httpd php70w php70w-opcache php70w-intl.x86_64 php70w-devel.x86_64 php70w-mbstring.x86_64 php70w-pecl-redis.x86_64 git vim wget; yum clean all; systemctl enable httpd.service
RUN wget https://dev.mysql.com/get/mysql57-community-release-el7-9.noarch.rpm 
RUN rpm -ivh mysql57-community-release-el7-9.noarch.rpm 
RUN yum install -y mysql-server ; systemctl enable mysqld.service ; yum clean all


#ENTRYPOINT systemctl start mysqld.service
#ENTRYPOINT systemctl start httpd.service
ADD updatepassroot.sh /
RUN chmod +x /updatepassroot.sh
#RUN /updatepassroot.sh
COPY src/ /var/www/html/
EXPOSE 80

#INSTALL PHP

