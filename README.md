# Simple docker running collectd

An all-in-one image 

* [**ubuntu**](http://www.ubuntu.com/server) 14.04 LTS
* [**collectd**](https://github.com/collectd/collectd) 5.5.1

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
    docker run -d y4ns0l0/collectd\
     collectd -f -C /tmp/testConfig.conf
```
Put your config file in data volume and use it :
```bash
    docker run -d y4ns0l0/collectd\
     -v /data/collectd:/opt/collectd/etc\
     collectd -f
```
Plugins
-------

This is a basic compilation of collectd sources, I just add :

* `libsnmp-dev` so [collectd-snmp](https://collectd.org/documentation/manpages/collectd-snmp.5.shtml) is enabled.
* `libperl-dev` so [collectd-perl](https://collectd.org/documentation/manpages/collectd-perl.5.shtml) is enabled.

```
Here is a list of compiled plugins :

  Modules:
    aggregation . . . . . yes
    amqp    . . . . . . . no
    apache  . . . . . . . no
    apcups  . . . . . . . yes
    apple_sensors . . . . no
    aquaero . . . . . . . no
    ascent  . . . . . . . no
    barometer . . . . . . no
    battery . . . . . . . yes
    bind  . . . . . . . . no
    ceph  . . . . . . . . no
    cgroups . . . . . . . yes
    conntrack . . . . . . yes
    contextswitch . . . . yes
    cpu . . . . . . . . . yes
    cpufreq . . . . . . . yes
    csv . . . . . . . . . yes
    curl  . . . . . . . . no
    curl_json . . . . . . no
    curl_xml  . . . . . . no
    dbi . . . . . . . . . no
    df  . . . . . . . . . yes
    disk  . . . . . . . . yes
    dns . . . . . . . . . no
    drbd  . . . . . . . . yes
    email . . . . . . . . yes
    entropy . . . . . . . yes
    ethstat . . . . . . . yes
    exec  . . . . . . . . yes
    fhcount . . . . . . . yes
    filecount . . . . . . yes
    fscache . . . . . . . yes
    gmond . . . . . . . . no
    hddtemp . . . . . . . yes
    interface . . . . . . yes
    ipc . . . . . . . . . yes
    ipmi  . . . . . . . . no
    iptables  . . . . . . no
    ipvs  . . . . . . . . yes
    irq . . . . . . . . . yes
    java  . . . . . . . . no
    load  . . . . . . . . yes
    logfile . . . . . . . yes
    log_logstash  . . . . no
    lpar  . . . . . . . . no
    lvm . . . . . . . . . no
    madwifi . . . . . . . yes
    match_empty_counter . yes
    match_hashed  . . . . yes
    match_regex . . . . . yes
    match_timediff  . . . yes
    match_value . . . . . yes
    mbmon . . . . . . . . yes
    md  . . . . . . . . . yes
    memcachec . . . . . . no
    memcached . . . . . . yes
    memory  . . . . . . . yes
    mic . . . . . . . . . no
    modbus  . . . . . . . no
    multimeter  . . . . . yes
    mysql . . . . . . . . no
    netapp  . . . . . . . no
    netlink . . . . . . . no
    network . . . . . . . yes
    nfs . . . . . . . . . yes
    nginx . . . . . . . . no
    notify_desktop  . . . no
    notify_email  . . . . no
    ntpd  . . . . . . . . yes
    numa  . . . . . . . . yes
    nut . . . . . . . . . no
    olsrd . . . . . . . . yes
    onewire . . . . . . . no
    openldap  . . . . . . no
    openvpn . . . . . . . yes
    oracle  . . . . . . . no
    perl  . . . . . . . . yes
    pf  . . . . . . . . . no
    pinba . . . . . . . . no
    ping  . . . . . . . . no
    postgresql  . . . . . no
    powerdns  . . . . . . yes
    processes . . . . . . yes
    protocols . . . . . . yes
    python  . . . . . . . no
    redis . . . . . . . . no
    routeros  . . . . . . no
    rrdcached . . . . . . no
    rrdtool . . . . . . . no
    sensors . . . . . . . yes
    serial  . . . . . . . yes
    sigrok  . . . . . . . no
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
    tokyotyrant . . . . . no
    turbostat . . . . . . yes
    unixsock  . . . . . . yes
    uptime  . . . . . . . yes
    users . . . . . . . . yes
    uuid  . . . . . . . . yes
    varnish . . . . . . . no
    virt  . . . . . . . . no
    vmem  . . . . . . . . yes
    vserver . . . . . . . yes
    wireless  . . . . . . yes
    write_graphite  . . . yes
    write_http  . . . . . no
    write_kafka . . . . . no
    write_log . . . . . . yes
    write_mongodb . . . . no
    write_redis . . . . . no
    write_riemann . . . . no
    write_sensu . . . . . yes
    write_tsdb  . . . . . yes
    xmms  . . . . . . . . no
    zfs_arc . . . . . . . yes
    zookeeper . . . . . . yes
```


License
-------

GNU General Public License Version 2

Author Information
------------------

Yann MATYSIAK - yann.matysiak@gmail.com
