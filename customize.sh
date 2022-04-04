SKIPUNZIP=1

PRINT() {
    ui_print "Cache+ (Magisk Module)"
    ui_print "• A module that allows your device"
    ui_print "• To clear cache of all apps on every boot."
    ui_print ""
    sleep 2
    ui_print "• And you can manually clear cache"
    ui_print "• By typing 'su -c cleaner' in Terminal."
    ui_print ""
    sleep 2
    ui_print "• More info about this module please read on cacheplus official repository."
    ui_print "• https://github.com/kageyuki-takeru/cacheplus"}
    ui_print ""
    sleep 2
}

EXEC() {
    ui_print "Installing..."
    sleep 1.5
    ui_print "- Extracting module files"
    unzip -o "$ZIPFILE" 'system/*' -d $MODPATH >&2
    unzip -o "$ZIPFILE" module.prop -d $MODPATH >&2
    unzip -o "$ZIPFILE" service.sh -d $MODPATH >&2
	chmod -R 755 $MODPATH/system/xbin
    sleep 1.5
    
    ui_print "- Set permissions"
    set_perm_recursive $MODPATH 0 0 0755 0644
    set_perm $MODPATH/system/xbin/cleaner 0 0 0755 0755
    sleep 1.5
}

if [ ! "$SKIPUNZIP" = "0" ]; then
    set -x
    PRINT
    EXEC
else
    set +x
    abort
fi
