#!/system/bin/sh
MODDIR=${0%/*}

# Cache Cleaner (clear cache of all apps on every boot)
find /data/data/*/cache/* -delete
find /sdcard/Android/data/*/cache/* -delete
