FROM debian:latest

MAINTAINER Nikolay Khasanov <nk.khasanov@gmail.com>

RUN \
    # Temporary install required soft
    apt-get update && \
    apt-get install -y curl unzip && \
    
    # Download packages
    curl -L -C - -b "oraclelicense=accept-securebackup-cookie" -o /tmp/oracle-jre.tar.gz http://download.oracle.com/otn-pub/java/jdk/8u31-b13/jre-8u31-linux-x64.tar.gz && \
    curl -L -C - -b "oraclelicense=accept-securebackup-cookie" -o /tmp/jce_policy.zip http://download.oracle.com/otn-pub/java/jce/8/jce_policy-8.zip && \
    
    # Unpack JRE
    mkdir -p /usr/lib/jvm/jre/ && \
    tar -xzf /tmp/oracle-jre.tar.gz -C /usr/lib/jvm/jre/ --strip-components=1  && \
    
    # Unpack JCE Policy
    unzip /tmp/jce_policy.zip -d /tmp && \
    cp -f /tmp/UnlimitedJCEPolicyJDK8/*.jar /usr/lib/jvm/jre/lib/security/ && \
    
    # Install alternatives
    update-alternatives --install /usr/bin/ControlPanel ControlPanel /usr/lib/jvm/jre/bin/ControlPanel 1 && \
    update-alternatives --install /usr/bin/java         java         /usr/lib/jvm/jre/bin/java 1 && \
    update-alternatives --install /usr/bin/jcontrol     jcontrol     /usr/lib/jvm/jre/bin/jcontrol 1 && \
    update-alternatives --install /usr/bin/jjs          jjs          /usr/lib/jvm/jre/bin/jjs 1 && \
    update-alternatives --install /usr/bin/keytool      keytool      /usr/lib/jvm/jre/bin/keytool 1 && \
    update-alternatives --install /usr/bin/pack200      pack200      /usr/lib/jvm/jre/bin/pack200 1 && \
    update-alternatives --install /usr/bin/unpack200    unpack200    /usr/lib/jvm/jre/bin/unpack200 1 && \
    
    # Cleanup
    rm -fr /tmp/* && \
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
    apt-get -y remove curl unzip && \
    apt-get -y autoremove 
