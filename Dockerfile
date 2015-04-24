FROM debian:7.8
MAINTAINER sharaku

# Install.
RUN \
  apt-get update && \
  apt-get -y install ircd-ircu

# Add files.
ADD ircd.conf /etc/ircd/ircd.conf
ADD start.sh /opt/start.sh
RUN \
  chmod 555 /opt/start.sh && \
  /etc/init.d/ircd-ircu start && \
  /etc/init.d/ircd-ircu stop

# Set environment variables.
ENV HOME /tmp

# Define working directory.
WORKDIR /tmp

# exec user
USER root

EXPOSE 6667
CMD ["/opt/start.sh"]
