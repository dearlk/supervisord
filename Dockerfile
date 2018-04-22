FROM ubuntu:14.04
MAINTAINER Lalit Kumar <lalit.kumar@gmail.com>;
RUN apt-get update && apt-get install -y openssh-server apache2 supervisor nginx
RUN mkdir -p /var/lock/apache2 /var/run/apache2 /var/run/sshd /var/log/supervisor
RUN echo 'root:password' | chpasswd
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
EXPOSE 22 80 443
CMD ["/usr/bin/supervisord"]

