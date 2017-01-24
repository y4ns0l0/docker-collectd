FROM ubuntu:16.04

# ---------------- #
#   Installation   #
# ---------------- #

ENV DEBIAN_FRONTEND noninteractive

# Install all prerequisites for building collectd
RUN apt-get -y update && apt-get -y install wget build-essential 

# Install all dependencies for collectd plugins. Here we want collectd-snmp
RUN apt-get -y install libsnmp-dev libperl-dev python3-dev

# Get and untar sources files
RUN wget https://collectd.org/files/collectd-5.7.1.tar.bz2
RUN tar jxvf collectd-5.7.1.tar.bz2 && rm collectd-5.7.1.tar.bz2

# Compile and purge source files
RUN cd collectd-5.7.1 && ./configure && make all install
RUN cd .. && rm -rf collectd-5.7.1

# Optionnal post installation tasks
RUN ln -s /opt/collectd/sbin/collectd /usr/sbin/collectd
RUN ln -s /opt/collectd/sbin/collectdmon /usr/sbin/collectdmon

RUN apt-get clean
RUN apt-get purge
