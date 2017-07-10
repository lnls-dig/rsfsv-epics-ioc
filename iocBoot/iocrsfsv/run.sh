#!/bin/sh

# Tests if variable EPICS_HOST_ARCH exists. If not, how message
: ${EPICS_HOST_ARCH:?"Environment variable needs to be set"}

# Select device IP.
if [ -z "$DEVICE_IP" ]; then
    DEVICE_IP="$1"
fi

if [ -z "$DEVICE_IP" ]; then
    echo "\"DEVICE_IP\" variable unset."
    exit 1
fi

DEVICE_IP="${DEVICE_IP}" "../../bin/${EPICS_HOST_ARCH}/rsfsv" st.cmd
