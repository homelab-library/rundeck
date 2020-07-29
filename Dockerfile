FROM proctorlabs/selfhosted-base:stretch-java
RUN apt-get update && apt-get install -yy --no-install-recommends curl gnupg2 ca-certificates apt-transport-https && \
    echo "deb https://rundeck.bintray.com/rundeck-deb /" > /etc/apt/sources.list.d/rundeck.list && \
    curl 'https://bintray.com/user/downloadSubjectPublicKey?username=bintray' | apt-key add - && \
    apt-get update && apt-get install -yy --no-install-recommends rundeck rundeck-cli python3 python3-pip python3-yaml && \
    rm -rf /var/lib/apt/lists/* && \
    pip3 install kubernetes && ln -sf /usr/bin/python3 /usr/bin/python && \
    rm -r /root/.cache && \
    curl -sL "https://github.com/rundeck-plugins/kubernetes/releases/download/2.0.0/kubernetes-plugin-2.0.0.zip" > "/var/lib/rundeck/libext/kubernetes-plugin-2.0.0.zip"

COPY rootfs/ /

EXPOSE 4440
VOLUME [ "/rundeck" ]
ENTRYPOINT [ "/init" ]
CMD []
