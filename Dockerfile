FROM ubuntu:14.04

# ---------------- #
#   Installation   #
# ---------------- #

ENV DEBIAN_FRONTEND noninteractive

# Install all prerequisites for building collectd
RUN apt-get -y update && apt-get -y install wget build-essential 

# Install all dependencies for collectd plugins. Here we want collectd-snmp
RUN apt-get -y install libsnmp-dev

# Get and untar sources files
RUN wget https://collectd.org/files/collectd-5.5.1.tar.gz
RUN tar -zxf collectd-5.5.1.tar.gz && rm collectd-5.5.1.tar.gz

# Compile and purge source files
RUN cd collectd-5.5.1 && ./configure && make all install
RUN cd && rm -rf collectd-5.5.1

# Optionnal post installation tasks
RUN ln -s /opt/collectd/sbin/collectd /usr/sbin/collectd
RUN ln -s /opt/collectd/sbin/collectdmon /usr/sbin/collectdmon

RUN apt-get clean
RUN apt-get purge