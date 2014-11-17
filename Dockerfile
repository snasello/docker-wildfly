# Wildfly
#
# VERSION 0.0.1
#

FROM snasello/java:busybox-java8u20

MAINTAINER Samuel Nasello <samuel.nasello@elosi.com>

ENV WF_VERSION 8.1.0.Final
ENV WF_HOME /wildfly

# Install Wildfly.

RUN wget --quiet http://download.jboss.org/wildfly/${WF_VERSION}/wildfly-${WF_VERSION}.tar.gz -O /wildfly-${WF_VERSION}.tar.gz \
	&& tar xfz /wildfly-${WF_VERSION}.tar.gz -C / \
	&& rm -f /wildfly-${WF_VERSION}.tar.gz \
	&& ln -s  /wildfly-${WF_VERSION} ${WF_HOME}

# Define working directory.
WORKDIR /wildfly

# Define default command.
ENTRYPOINT ["/wildfly/bin/standalone.sh"]
CMD ["-b", "0.0.0.0","-bmanagement", "0.0.0.0"]

# Expose ports.
#   - 8080: HTTP
#   - 8009: AJP
#   - 9990: Admin console
EXPOSE 8080 8009 9990


