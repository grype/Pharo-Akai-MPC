# Pharo-Akai-MPC
Support for reading AKAI MPC files in Pharo.

## Installing

```smalltalk
Metacello new
  baseline: 'AkaiMPC';
  repository: 'github://grype/Pharo-Akai-MPC';
  load
```

## Reading .PRG files

```smalltalk
(AkaiMPCProgramReader on: '/path/to/FILE.PRG' asFileReference binaryReadStream) next inspect.
```
