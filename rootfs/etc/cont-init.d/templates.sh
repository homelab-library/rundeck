#!/usr/bin/with-contenv bash
set -Eeuo pipefail

templar -d /etc/rundeck.tpl/data.yml -t /etc/rundeck.tpl/rundeck-config.properties -o /etc/rundeck/rundeck-config.properties
