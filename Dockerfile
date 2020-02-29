FROM registry.access.redhat.com/ubi8/ubi-minimal:8.0

RUN microdnf -y install --nodocs nginx \
  && rm  /usr/share/nginx/html/* \
  && microdnf clean all

COPY ./nginx.conf /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;"]
