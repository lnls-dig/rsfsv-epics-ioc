# rsfsv-epics-ioc

## Overall

Repository containing the EPICS IOC support for the R&S FSV signal
analyzer.

## Example

### Initialization

For the IOC on this repository, the initialization can be done through
the following commands starting at the top level directory:


```sh
$ make clean &&
$ make uninstall &&
$ make &&
$ cd iocBoot/iocrsfsv &&
$ DEVICE_IP="10.0.18.77" P="TEST:" R="RSFSV:" ../../bin/linux-x86_64/rsfsv ./st.cmd
```

The *DEVICE_IP* specify the instrument IP.

In some situations is desired to run the process using the procServ,
which enables the IOC to be controlled by the system. This is done
through the following commands:

```sh
$ make clean &&
$ make uninstall &&
$ make &&
$ cd iocBoot/iocrsfsv &&
$ procServ -n "RSFSV" -f -i ^C^D 20000 ./run.sh -i "10.0.18.77" -p "TEST:" -r "RSFSV:"
```

It is important to notice that the *DEVICE_IP* is passed as an argument to the
`./run.sh` script using the `-i` option (long form: `--device-ip`). The optional
`-p` and `-r` options specify the prefix of the PV names.


### Caput

An example of writing span is given below:

```
$ caput ${P}${R}FREQ:Span-SP 1e6
```

### Caget

An example of reading span is given below:

```
$ caget ${P}${R}FREQ:Span-RB
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
