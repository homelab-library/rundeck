#!/usr/bin/env bash

echo "Preparing rundeck plugins"
cp -r /rundeck/plugins/* /var/lib/rundeck/libext/
chown -R rundeck:rundeck /var/lib/rundeck/libext/
