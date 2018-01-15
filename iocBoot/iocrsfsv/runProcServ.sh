#!/bin/sh

# Run run*.sh scripts with procServ
/usr/local/bin/procServ -f -n rsfsv -i ^C^D 20000 ./runrsfsv.sh "$@"
