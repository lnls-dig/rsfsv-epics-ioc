#!/bin/sh

# Use defaults is not set
if [ -z "${RSFSV_DEVICE_TELNET_PORT}" ]; then
    RSFSV_DEVICE_TELNET_PORT=20000
fi

# Run run*.sh scripts with procServ
/usr/local/bin/procServ -f -n rsfsv${RSFSV_INSTANCE} -i ^C^D ${RSFSV_DEVICE_TELNET_PORT} ./runrsfsv.sh "$@"
