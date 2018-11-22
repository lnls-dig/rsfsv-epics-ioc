# !! WARNING !! DEPRECATED REPOSITORY. USE NEW REPOSIORY https://github.com/lnls-dig/rsfsx-epics-ioc

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
$ DEVICE_IP="10.0.18.77" P="TEST:" R="RSFSV:" ../../bin/linux-x86_64/rsfsv ./strsfsv.cmd
```

The *DEVICE_IP* specifies the instrument IP.

In some situations it is desired to run the process using the procServ,
which enables the IOC to be controlled by the system. This is done
through the following commands:

```sh
$ make clean &&
$ make uninstall &&
$ make &&
$ cd iocBoot/iocrsfsv &&
$ procServ -n "RSFSV" -f -i ^C^D 20000 ./runrsfsv.sh -i "10.0.18.77" -P "TEST:" -R "RSFSV:"
```

It is important to notice that the *DEVICE_IP* is passed as an argument to the
`./runrsfsv.sh` script using the `-i` option (long form: `--device-ip`). The optional
`-P` and `-R` options specify the prefix of the PV names.


### Caput

An example of writing span is given below:

```
$ caput ${P}${R}FreqSpan-SP 1e6
```

### Caget

An example of reading span is given below:

```
$ caget ${P}${R}FreqSpan-RB
```

## Implemented Functionalities

The functionalities are divided in 3 major groups: General, Freq and
Mark. There are always two possible suffixes, one for reading the value and one for changing
the value. For each variable below, they are given inside braces as the read and
write suffixes separated by a comma, respectively. Devices with no read or no
write access are marked as such by having a single prefix.

- **GENERAL** - General functionalities
 - **GeneralReset-Cmd**: Reset the device to default state
 - **GeneralIdn-Cte**: Get the device identification - *read only*
 - **GeneralRefLvl-{RB,SP}**: Set reference level (dBm)
 - **GeneralRefOff-{RB,SP}**: Set reference level offset (dBm)
 - **GeneralSweMode-{Sts,Sel}**: Set sweep mode (SINGLE|CONTINUOUS)
 - **GeneralSwePoints-{RB,SP}**: Set number of points in one sweep
 - **GeneralAutoFreq-Cmd**: Auto adjust center frequency (OFF|ON)
 - **GeneralAutoLvl-Cmd**: Auto adjust reference level (OFF|ON)
 - **GeneralAutoAll-Cmd**: Auto adjust frequency and reference level (OFF|ON)
 - **GeneralTrace-RB**: Get trace waveform - *read only*

- **FREQ** - Functionalities related to FREQuency
 - **FreqCenter-{RB,SP}**: Set center frequency (Hz)
 - **FreqSpan-{RB,SP}**: Set frequency span (Hz)
 - **FreqStart-{RB,SP}**: Set start frequency (Hz)
 - **FreqStop-{RB,SP}**: Set stop frequency (Hz)

- **MARK** - Functionalities related to MARKers
 - **MarkX-{RB,SP}**: Set X value of the marker (seconds or Hz)
 - **MarkY-RB**: Get Y value of the marker (dBm) - *read only*
 - **MarkFindMax-Cmd**: Set marker to max peak on trace (OFF|ON)
