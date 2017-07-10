#!/bin/sh

# Tests if variable EPICS_HOST_ARCH exists. If not, how message
: ${EPICS_HOST_ARCH:?"Environment variable needs to be set"}


# Select device IP.
DEVICE_IP="$1"

if [ -z "$DEVICE_IP" ]; then
    echo "\"DEVICE_IP\" variable unset."
    exit 1
fi

# Select instance of the device.
DEVICE_INST="$2"

if [ -z "$DEVICE_INST" ]; then
    echo "\"DEVICE_INST\" variable unset."
    exit 1
fi

DEVICE_IP="${DEVICE_IP}" DEVICE_INST="${DEVICE_INST}" "../../bin/${EPICS_HOST_ARCH}/rsfsv" st.cmd
