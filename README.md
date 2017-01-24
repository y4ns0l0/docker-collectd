# Simple docker running collectd

An all-in-one image 

* [**ubuntu**](http://www.ubuntu.com/server) 16.04 LTS
* [**collectd**](https://github.com/collectd/collectd) 5.7.1

All collectd directories are located in `/opt/collectd`. Default config file is `/opt/collectd/etc/collectd.conf`

`collectd` and `collectd` are added in PATH env

Usage
-----

Get help :
```bash
docker run --rm  y4ns0l0/collectd collectd -h
```

Running collectd in deamon mode with specifed configuration file :
```bash
    docker run -d y4ns0l0/collectd \
     collectd -f -C /tmp/testConfig.conf
```
Put your config file in data volume and use it :
```bash
    docker run -d y4ns0l0/collectd \
     -v /data/collectd:/opt/collectd/etc \
     collectd -f
```
Plugins
-------

This is a basic compilation of collectd sources, I just add :

* `libsnmp-dev` so [collectd-snmp](https://collectd.org/documentation/manpages/collectd-snmp.5.shtml) is enabled.
* `libperl-dev` so [collectd-perl](https://collectd.org/documentation/manpages/collectd-perl.5.shtml) is enabled.
* `python3-dev` so [collectd-python](https://collectd.org/documentation/manpages/collectd-python.5.shtml) is enabled.

```
Here is the list of compiled plugins :

Modules:
    aggregation . . . . . yes
    amqp    . . . . . . . no (amqp.h not found)
    apache  . . . . . . . no (curl-config failed)
    apcups  . . . . . . . yes
    apple_sensors . . . . no
    aquaero . . . . . . . no (libaquaero5.h not found)
    ascent  . . . . . . . no
    barometer . . . . . . no
    battery . . . . . . . yes
    bind  . . . . . . . . no
    ceph  . . . . . . . . no
    cgroups . . . . . . . yes
    chrony. . . . . . . . yes
    conntrack . . . . . . yes
    contextswitch . . . . yes
    cpu . . . . . . . . . yes
    cpufreq . . . . . . . yes
    cpusleep  . . . . . . yes
    csv . . . . . . . . . yes
    curl  . . . . . . . . no (curl-config failed)
    curl_json . . . . . . no
    curl_xml  . . . . . . no
    dbi . . . . . . . . . no (dbi/dbi.h not found)
    df  . . . . . . . . . yes
    disk  . . . . . . . . yes
    dns . . . . . . . . . no (pcap.h misses PCAP_ERROR_IFACE_NOT_UP)
    dpdkstat  . . . . . . no
    drbd  . . . . . . . . yes
    email . . . . . . . . yes
    entropy . . . . . . . yes
    ethstat . . . . . . . yes
    exec  . . . . . . . . yes
    fhcount . . . . . . . yes
    filecount . . . . . . yes
    fscache . . . . . . . yes
    gmond . . . . . . . . no (gm_protocol.h not found)
    gps . . . . . . . . . no
    grpc  . . . . . . . . no
    hddtemp . . . . . . . yes
    hugepages . . . . . . yes
    intel_rdt. . . . .  . no (pqos.h not found)
    interface . . . . . . yes
    ipc . . . . . . . . . yes
    ipmi  . . . . . . . . no
    iptables  . . . . . . no (pkg-config doesn't know libiptc)
    ipvs  . . . . . . . . yes
    irq . . . . . . . . . yes
    java  . . . . . . . . no (jar not found)
    load  . . . . . . . . yes
    logfile . . . . . . . yes
    log_logstash  . . . . no
    lpar  . . . . . . . . no (AIX only)
    lua . . . . . . . . . no (pkg-config cannot find liblua)
    lvm . . . . . . . . . no (lvm2app.h not found)
    madwifi . . . . . . . yes
    match_empty_counter . yes
    match_hashed  . . . . yes
    match_regex . . . . . yes
    match_timediff  . . . yes
    match_value . . . . . yes
    mbmon . . . . . . . . yes
    md  . . . . . . . . . yes
    memcachec . . . . . . no (libmemcached/memcached.h not found)
    memcached . . . . . . yes
    memory  . . . . . . . yes
    mic . . . . . . . . . no (MicAccessApi not found)
    modbus  . . . . . . . no (pkg-config doesn't know libmodbus)
    mqtt  . . . . . . . . no (mosquitto.h not found)
    multimeter  . . . . . yes
    mysql . . . . . . . . no (mysql_config failed)
    netapp  . . . . . . . no (netapp_api.h not found)
    netlink . . . . . . . no (symbol 'mnl_nlmsg_get_payload' not found)
    network . . . . . . . yes
    nfs . . . . . . . . . yes
    nginx . . . . . . . . no (curl-config failed)
    notify_desktop  . . . no (pkg-config doesn't know libnotify)
    notify_email  . . . . no (libesmtp not found)
    notify_nagios . . . . yes
    ntpd  . . . . . . . . yes
    numa  . . . . . . . . yes
    nut . . . . . . . . . no (pkg-config doesn't know libupsclient)
    olsrd . . . . . . . . yes
    onewire . . . . . . . no (owcapi.h not found)
    openldap  . . . . . . no ('ldap.h' not found)
    openvpn . . . . . . . yes
    oracle  . . . . . . . no (ORACLE_HOME is not set)
    perl  . . . . . . . . yes
    pf  . . . . . . . . . no
    pinba . . . . . . . . no
    ping  . . . . . . . . no (oping.h not found)
    postgresql  . . . . . no (libpq-fe.h not found)
    powerdns  . . . . . . yes
    processes . . . . . . yes
    protocols . . . . . . yes
    python  . . . . . . . yes
    redis . . . . . . . . no (hiredis.h not found)
    routeros  . . . . . . no (routeros_api.h not found)
    rrdcached . . . . . . no
    rrdtool . . . . . . . no (rrd.h not found)
    sensors . . . . . . . yes
    serial  . . . . . . . yes
    sigrok  . . . . . . . no (pkg-config could not find libsigrok)
    smart . . . . . . . . no
    snmp  . . . . . . . . yes
    statsd  . . . . . . . yes
    swap  . . . . . . . . yes
    syslog  . . . . . . . yes
    table . . . . . . . . yes
    tail_csv  . . . . . . yes
    tail  . . . . . . . . yes
    tape  . . . . . . . . no
    target_notification . yes
    target_replace  . . . yes
    target_scale  . . . . yes
    target_set  . . . . . yes
    target_v5upgrade  . . yes
    tcpconns  . . . . . . yes
    teamspeak2  . . . . . yes
    ted . . . . . . . . . yes
    thermal . . . . . . . yes
    threshold . . . . . . yes
    tokyotyrant . . . . . no (tcrdb.h not found)
    turbostat . . . . . . yes
    unixsock  . . . . . . yes
    uptime  . . . . . . . yes
    users . . . . . . . . yes
    uuid  . . . . . . . . yes
    varnish . . . . . . . no (pkg-config doesn't know varnishapi)
    virt  . . . . . . . . no
    vmem  . . . . . . . . yes
    vserver . . . . . . . yes
    wireless  . . . . . . yes
    write_graphite  . . . yes
    write_http  . . . . . no (curl-config failed)
    write_kafka . . . . . no (librdkafka/rdkafka.h not found)
    write_log . . . . . . yes
    write_mongodb . . . . no ('mongo.h' not found)
    write_prometheus. . . no
    write_redis . . . . . no (hiredis.h not found)
    write_riemann . . . . no (pkg-config doesn't know libriemann-client)
    write_sensu . . . . . yes
    write_tsdb  . . . . . yes
    xencpu  . . . . . . . no
    xmms  . . . . . . . . no
    zfs_arc . . . . . . . yes
    zone  . . . . . . . . no
    zookeeper . . . . . . yes
```


License
-------

GNU General Public License Version 2

Author Information
------------------

Yann MATYSIAK - yann.matysiak@gmail.com
