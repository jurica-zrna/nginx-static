FROM registry.access.redhat.com/ubi8/ubi-minimal:8.0

RUN microdnf -y install --nodocs nginx \
  && rm  /usr/share/nginx/html/* \
  && microdnf clean all \
  && touch /var/run/nginx.pid \
  && chgrp 0 /var/run/nginx.pid \
  && chmod g=u /var/run/nginx.pid

COPY ./nginx.conf /etc/nginx/nginx.conf

EXPOSE 8080

VOLUME ["/usr/share/nginx/html/"]

CMD ["nginx", "-g", "daemon off;"]
