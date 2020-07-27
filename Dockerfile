FROM proctorlabs/selfhosted-base:stretch-java
RUN apt-get update && apt-get install -yy --no-install-recommends curl gnupg2 ca-certificates apt-transport-https && \
    echo "deb https://rundeck.bintray.com/rundeck-deb /" > /etc/apt/sources.list.d/rundeck.list && \
    curl 'https://bintray.com/user/downloadSubjectPublicKey?username=bintray' | apt-key add - && \
    apt-get update && apt-get install -yy --no-install-recommends rundeck rundeck-cli && \
    rm -rf /var/lib/apt/lists/* && \
    curl -sL "https://github.com/rundeck-plugins/docker/releases/download/1.4.1/docker-container-1.4.1.zip" > "/var/lib/rundeck/libext/docker-container-1.4.1.zip" && \
    curl -sL "https://github.com/rundeck-plugins/kubernetes/releases/download/2.0.0/kubernetes-plugin-2.0.0.zip" > "/var/lib/rundeck/libext/kubernetes-plugin-2.0.0.zip"

COPY rootfs/ /
ENTRYPOINT [ "/init" ]
CMD []
