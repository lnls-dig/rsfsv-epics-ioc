# rsfsv-epics-ioc

## Overall

Repository containing the EPICS IOC support for the R&S FSV signal
analyzer.

## PV Structures

The PVs have 3 parameters: The device identifier, the functionality
group and the functionality name, all separated by colons as shown
below.

```
DEVICE_IDN:GROUP:NAME
```

The DEVICE_IDN is set on the *st.cmd* file, and can be easily
customized. For the initialization of the IOC, the device IP must be
given, either by passing it as the argument *DEVICE_IP* during the
initialization or by setting it on the
*iocBoot/iocrsfsv/device.config* file.

## Example

### Initialization

For the IOC on this repository, the initialization can be done through
the following commands starting at the top level directory:


```sh
$ make clean &&
$ make uninstall &&
$ make &&
$ cd iocBoot/iocrsfsv &&
$ DEVICE_IP="10.0.18.77" DEVICE_INST="0" ../../bin/linux-x86_64/rsfsv ./st.cmd
```

The *DEVICE_IP* and *DEVICE_INST* specify the instrument IP and the
instantiation tag, which will be present at the *DEVICE_IDN* and should
be unique to differenciate the device from similars.

### Caput

An example of writing span is given below:

```
$ caput DIG-RSFSV-0:FREQ:Span 1e6
```

### Caget

An example of reading span is given below:

```
$ caget DIG-RSFSV-0:FREQ:Span_RBV
```

## Implemented Functionalities

The functionalities are divided in 3 major groups: GENERAL, FREQ and
MARK. To set values, use the given name. To read them, add *_RBV*
after it.

- **GENERAL** - General functionalities
 - **Reset**: Reset the device to default state
 - **Idn**: Get the device identification - *read only*
 - **RefLvl**: Set reference level (dBm)
 - **RefOff**: Set reference level offset (dBm)
 - **SweMode**: Set sweep mode (SINGLE|CONTINUOUS)
 - **SwePoints**: Set number of points in one sweep
 - **AutoFreq**: Auto adjust center frequency (OFF|ON)
 - **AutoLvl**: Auto adjust reference level (OFF|ON)
 - **AutoAll**: Auto adjust frequency and reference level (OFF|ON)
 - **Trace_RBV**: Get trace waveform - *read only*

- **FREQ** - Functionalities related to FREQuency
 - **Center**: Set center frequency (Hz)
 - **Span**: Set frequency span (Hz)
 - **Start**: Set start frequency (Hz)
 - **Stop**: Set stop frequency (Hz)


- **MARK** - Functionalities related to MARKers
 - **X**: Set X value of the marker (seconds or Hz)
 - **Y_RBV**: Get Y value of the marker (dBm) - *read only*
 - **FindMax**: Set marker to max peak on trace (OFF|ON)
