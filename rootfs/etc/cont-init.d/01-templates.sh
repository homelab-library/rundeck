#!/usr/bin/with-contenv bash

TPL_DIR="/etc/rundeck.tpl"
TGT_DIR="/etc/rundeck"
DATA_YML="/rundeck.yml"

echo "Preparing rundeck configurations..."

for tpl in ${TPL_DIR}/* ; do
    echo "Processing $(basename "$tpl")"
    templar -d "${DATA_YML}" -t "${tpl}" -o "${TGT_DIR}/$(basename "$tpl")"
done

echo "Finished preparing configurations!"
