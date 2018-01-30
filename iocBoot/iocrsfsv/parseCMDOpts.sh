#!/bin/sh

while [ "$#" -gt 0 ]; do
    case "$1" in
        "-P") P="$2" ;;
        "-R") R="$2" ;;
        "-i"|"--device-ip") DEVICE_IP="$2" ;;
        *) echo "Usage:" >&2
            echo "  $0 -i DEVICE_IP [-P P_VAL] [-R R_VAL] " >&2
            echo >&2
            echo " Options:" >&2
            echo "  -i or --device-ip                        Configure device IP address" >&2
            echo "  -P                                       Configure value of \$(P) macro" >&2
            echo "  -R                                       Configure value of \$(R) macro" >&2
            exit 2
    esac

    shift 2
done

if [ -z "$EPICS_CA_MAX_ARRAY_BYTES" ]; then
    export EPICS_CA_MAX_ARRAY_BYTES=64002
fi
