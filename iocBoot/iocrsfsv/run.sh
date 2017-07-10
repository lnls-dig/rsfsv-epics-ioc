#!/bin/sh

# Tests if variable EPICS_HOST_ARCH exists. If not, how message
: ${EPICS_HOST_ARCH:?"Environment variable needs to be set"}

while [ "$#" -gt 0 ]; do
    case "$1" in
        "-i"|"--device-ip") DEVICE_IP="$2" ;;
        "-p") P="$2" ;;
        "-r") R="$2" ;;
        *) echo "Usage:" >&2
            echo "  $0 -i DEVICE_IP [-p P_VAL] [-r R_VAL]" >&2
            echo >&2
            echo " Options:" >&2
            echo "  -i or --device-ip    Configure IP address to connect to device" >&2
            echo "  -p                   Configure value of \$(P) macro" >&2
            echo "  -r                   Configure value of \$(R) macro" >&2
            exit 1
    esac

    shift 2
done

if [ -z "$DEVICE_IP" ]; then
    echo "\"DEVICE_IP\" variable unset."
    exit 1
fi

DEVICE_IP="${DEVICE_IP}" P="$P" R="$R" "../../bin/${EPICS_HOST_ARCH}/rsfsv" st.cmd
