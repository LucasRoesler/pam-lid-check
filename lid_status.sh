#!/bin/sh
# From: https://unix.stackexchange.com/a/551220
# This is a dbus alternative to the pam_check_lid

dbus-send --system --print-reply=literal \
    --dest=org.freedesktop.login1 /org/freedesktop/login1 \
    org.freedesktop.DBus.Properties.Get \
        string:org.freedesktop.login1.Manager string:LidClosed | \
            awk 'NR==1{print $3=="true"?"closed":"open"}'