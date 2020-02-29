FROM registry.access.redhat.com/ubi8/ubi-minimal:8.0

RUN microdnf -y install --nodocs nginx \
  && rm  /usr/share/nginx/html/* \
  && microdnf clean all \
  && chgrp -R 0 /var/run \
  && chmod -R g=u /var/run

COPY ./nginx.conf /etc/nginx/nginx.conf

EXPOSE 8081

VOLUME ["/usr/share/nginx/html/"]

CMD ["nginx", "-g", "daemon off;"]
