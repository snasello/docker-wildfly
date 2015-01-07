# Wildfly
#
# VERSION 0.0.1
#

FROM snasello/java:debian-java8u25

MAINTAINER Samuel Nasello <samuel.nasello@elosi.com>

ENV WF_VERSION 8.1.0.Final
ENV WF_HOME /wildfly

# Install Wildfly.

RUN wget --quiet http://download.jboss.org/wildfly/${WF_VERSION}/wildfly-${WF_VERSION}.tar.gz -O /wildfly-${WF_VERSION}.tar.gz \
	&& tar xfz /wildfly-${WF_VERSION}.tar.gz -C / \
	&& rm -f /wildfly-${WF_VERSION}.tar.gz \
	&& rm -rf /wildfly-${WF_VERSION}/welcome-content \
	&& ln -s  /wildfly-${WF_VERSION} ${WF_HOME}

# Define mountable directories.
VOLUME ["/wildfly/standalone","/wildfly/domain"]

# Define working directory.
WORKDIR /wildfly

# Define default command.
ENTRYPOINT ["/wildfly/bin/standalone.sh"]
CMD ["-c", "standalone-ha.xml"]

# Expose ports.
#   - 8080: HTTP
#   - 8009: AJP
#   - 9990: Admin console
EXPOSE 8080 8009 9990


