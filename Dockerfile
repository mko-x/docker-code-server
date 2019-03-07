FROM ubuntu-debootstrap
LABEL maintainer="Markus Kosmal - m-ko.de"

COPY ./code-server /usr/bin/code-server

RUN chmod +rx /usr/bin/code-server && \
    apt-get update -qq && \
    apt-get install -y -qq openssl

RUN mkdir -p /opt/code-start && \
    echo "Empty project provided for startup by m-ko.de" > /opt/code-start/README.md && \
    chmod -R +rwx /opt/code-start
          
EXPOSE 8443

ENTRYPOINT [ "code-server", "/opt/code-start" ]