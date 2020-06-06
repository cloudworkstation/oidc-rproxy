FROM ubuntu:18.04

# install software
ENV DEBIAN_FRONTEND=noninteractive 
RUN apt-get update -y
RUN apt-get install -y apache2 gettext-base libapache2-mod-auth-openidc  

# install apache config and modules
COPY config/oidc_auth.conf /apache.conf
RUN cd /etc/apache2/mods-enabled; ln -s ../mods-available/proxy.load
RUN cd /etc/apache2/mods-enabled; ln -s ../mods-available/proxy_wstunnel.load
RUN cd /etc/apache2/mods-enabled; ln -s ../mods-available/rewrite.load
RUN cd /etc/apache2/mods-enabled; ln -s ../mods-available/proxy_http.load

COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]

# expose apache2 port
EXPOSE 80

# run httpd in the foreground
CMD /usr/sbin/apache2ctl -D FOREGROUND
