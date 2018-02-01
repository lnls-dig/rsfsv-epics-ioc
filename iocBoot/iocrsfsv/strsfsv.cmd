< envPaths
< rsfsv.config

####################################################

epicsEnvSet("STREAM_PROTOCOL_PATH", "$(TOP)/rsfsvApp/Db")

## Register all support components
dbLoadDatabase("$(TOP)/dbd/rsfsv.dbd",0,0)
rsfsv_registerRecordDeviceDriver pdbbase

## Load record instances
dbLoadRecords("${TOP}/rsfsvApp/Db/rsfsv.db", "P=$(P), R=$(R), PORT=rsfsv_port, ADDR=0, TIMEOUT=1")

# Create the asyn port to use the VXI11 protocol
vxi11Configure("rsfsv_port","$(DEVICE_IP)",0,"0.0","inst0",0,0)

< save_restore.cmd

iocInit

## Start any sequence programs
# No sequencer program

# Create manual trigger for Autosave
create_triggered_set("auto_settings_rsfsv.req", "${P}${R}SaveTrg", "P=${P}, R=${R}")
set_savefile_name("auto_settings_rsfsv.req", "auto_settings_${P}${R}.sav")
