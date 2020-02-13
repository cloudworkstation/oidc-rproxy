FROM centos:7

RUN yum update -y

# install apache httpd
RUN yum install -y httpd gettext

# install mod_auth_openidc
RUN yum install -y mod_auth_openidc

# copy in config
RUN mkdir -p /conf
ADD config/oidc_auth.conf /etc/httpd/conf.d/auth.conf.template

# add statup script
ADD run-httpd.sh /run-httpd.sh
RUN chmod -v +x /run-httpd.sh

COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]

# run httpd
CMD [ "/run-httpd.sh" ]
