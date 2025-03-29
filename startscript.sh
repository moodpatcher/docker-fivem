#!/bin/sh

if [ -z "$KEY" ]; then
    echo
    echo "ERROR: \$KEY environment variable is not set. You can set it using the \"-e KEY=changeme\" parameter."
    echo

    exit 1
else
    :
fi

if [ -z "$(ls -A /FXServer)" ]; then
    cp -r /defaults/* /FXServer/
else
    :
fi

rm -rf /defaults
sed -i '/^sv_licenseKey/d' /FXServer/server-data/server.cfg
echo "sv_licenseKey ${KEY:-}" >> /FXServer/server-data/server.cfg
sh /FXServer/run.sh