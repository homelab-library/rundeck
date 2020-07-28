#!/usr/bin/with-contenv bash

echo "Copying ssh keys if available"
mkdir -p /var/lib/rundeck/.ssh/
cp /rundeck/.ssh/* /var/lib/rundeck/.ssh/
chown -R rundeck:rundeck /var/lib/rundeck/.ssh/
chmod 600 /var/lib/rundeck/.ssh/*
