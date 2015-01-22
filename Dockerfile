FROM debian:latest

MAINTAINER Nikolay Khasanov <nk.khasanov@gmail.com>

RUN \
    apt-get update && \
    apt-get install -y curl && \
    curl -SL http://javadl.sun.com/webapps/download/AutoDL?BundleId=101400 -o /tmp/oracle-jre.tar.gz && \
    mkdir -p /usr/lib/jvm/jre/ && \
    tar -xzf /tmp/oracle-jre.tar.gz -C /usr/lib/jvm/jre/ --strip-components=1 
    rm -f /tmp/oracle-jre.tar.gz && \
    rm -f /usr/lib/jvm/jre/bin/javaws && \
    rm -f /usr/lib/jvm/jre/bin/orbd && \
    rm -f /usr/lib/jvm/jre/bin/policytool && \
    rm -f /usr/lib/jvm/jre/bin/rmid && \
    rm -f /usr/lib/jvm/jre/bin/rmiregistry && \
    rm -f /usr/lib/jvm/jre/bin/servertool && \
    rm -f /usr/lib/jvm/jre/bin/tnameserv && \
    rm -f /usr/lib/jvm/jre/lib/audio/** && \
    rm -f /usr/lib/jvm/jre/lib/cmm/PYCC.pf && \
    rm -f /usr/lib/jvm/jre/lib/ext/dnsns.jar && \
    rm -f /usr/lib/jvm/jre/lib/i386/client/classes.jsa && \
    rm -f /usr/lib/jvm/jre/lib/javaws.jar && \
    rm -f /usr/lib/jvm/jre/lib/deploy.jar && \
    rm -f /usr/lib/jvm/jre/lib/plugin.jar && \
    update-alternatives --install /usr/bin/ControlPanel ControlPanel /usr/lib/jvm/jre/bin/ControlPanel" 1 && \
    update-alternatives --install /usr/bin/java         java         /usr/lib/jvm/jre/bin/java" 1 && \
    update-alternatives --install /usr/bin/jcontrol     jcontrol     /usr/lib/jvm/jre/bin/jcontrol" 1 && \
    update-alternatives --install /usr/bin/jjs          jjs          /usr/lib/jvm/jre/bin/jjs" 1 && \
    update-alternatives --install /usr/bin/keytool      keytool      /usr/lib/jvm/jre/bin/keytool" 1 && \
    update-alternatives --install /usr/bin/pack200      pack200      /usr/lib/jvm/jre/bin/pack200" 1 && \
    update-alternatives --install /usr/bin/unpack200    unpack200    /usr/lib/jvm/jre/bin/unpack200" 1 
