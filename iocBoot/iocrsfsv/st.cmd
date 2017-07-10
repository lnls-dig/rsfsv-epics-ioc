#!../../bin/linux-x86_64/rsfsv

## You may have to change rsfsv to something else
## everywhere it appears in this file

< envPaths

#cd ${TOP}

# Load device configurations
< device.config

epicsEnvSet("TOP", "../..")
epicsEnvSet("STREAM_PROTOCOL_PATH", "$(TOP)/rsfsvApp/Db")

## Register all support components
dbLoadDatabase("$(TOP)/dbd/rsfsv.dbd",0,0)
rsfsv_registerRecordDeviceDriver pdbbase

## Load record instances
dbLoadRecords("${TOP}/rsfsvApp/Db/rsfsv.db", "P=DIG, R=$(R), PORT=rsfsv_port, ADDR=0, TIMEOUT=1")

# Create the asyn port to use the VXI11 protocol
vxi11Configure("rsfsv_port","$(DEVICE_IP)",1,1000,"inst")

#cd ${TOP}/iocBoot/${IOC}
iocInit

## Start any sequence programs
#seq sncxxx,"user=finottiHost"
