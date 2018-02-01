TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = rsfsv
# rsfsv.dbd will be created and installed
DBD += rsfsv.dbd

# rsfsv.dbd will be made up from these files:
rsfsv_DBD += base.dbd

# Include dbd files from all support applications:
#rsfsv_DBD += xxx.dbd

# Add all the support libraries needed by this IOC
#rsfsv_LIBS += xxx

# rsfsv_registerRecordDeviceDriver.cpp derives from rsfsv.dbd
rsfsv_SRCS += rsfsv_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
rsfsv_SRCS_DEFAULT += rsfsvMain.cpp
rsfsv_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#rsfsv_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
rsfsv_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

rsfsv_DBD += asyn.dbd
rsfsv_DBD += drvAsynIPPort.dbd
rsfsv_DBD += drvVxi11.dbd
rsfsv_DBD += stream.dbd
rsfsv_DBD += calcSupport.dbd
rsfsv_DBD += asSupport.dbd

rsfsv_LIBS += asyn
rsfsv_LIBS += stream
rsfsv_LIBS += calc
rsfsv_LIBS += autosave
