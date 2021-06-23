#!/usr/bin/env bash

num='^[0-9]+$'
if [ -n "$DEFAULT_VNC_PORT" ]; then
    if [[ ${DEFAULT_VNC_PORT} =~ $num ]]; then
        port="${DEFAULT_VNC_PORT}"
        echo "VNC port set to ${port}"
    else
        echo "variable DEFAULT_VNC_PORT dosent contain a valid port number..."
        echo "getting back to default = 1..."
        port="1"
    fi
else
    port="1"
fi


echo "Stoping VNCSERVER at port :1"
vncserver --kill :${port} >> /dev/null

if [ -f /tmp/.X11-unix/X${port} ]; then
    echo "cleaning lock files..."
elif [ -f /tmp/.X${port}-lock ]; then
    echo "cleaning lock files..."
fi

echo "Cleaning pid,log files at ~/.vnc ..."
for files in  ~/.vnc/*$((5900+port)){.log,.pid}; do
    if [ -f "${files}" ]; then
        echo "cleaning ${files}..."
        rm -rf "${files}"
    fi
done

echo "done"