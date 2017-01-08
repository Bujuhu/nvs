---
title: PT 3.1 3.2
layout: report
date: 2016-12-12
task:
description: Erfüllung der Aufgabenstellung
subject: nvs
---

# Packet Tracer Übung 3.1

## Switches physisch verbinden

![](20161219_308x236.png)

## DTP Configuieren

```
int f0/7
switchport mode dynamic desirable
int f0/09
switchport mode dynamic desirable
```

![](20161219_560x368.png)

Die Interfaces sollten nun als trunk configuriert sein, da DTP aktiviert wurde.

![](20161219_476x206.png)

Dertrunking mode ist desirable

## VTP konfiguriern

### DS1

```
vtp domain CCNA-LAB
vtp password cisco12345
vtp mode server

vlan 10
vlan 20
vlan 30
vlan 40
vlan 50
```

![](20161219_579x373.png)


### AS1 & AS2

```
vtp domain CCNA-LAB
vtp password cisco12345
vtp mode client
```

![](20161219_433x111.png)

![](20161219_373x96.png)


# Packet Tracer Übung 3.1


## VTP Server konfiguriern

```
vtp domain CCNA-PT
vtp mode Server
vtp password 123PT
```

## Troubleshooting

![](20161219_185x54.png)

Es sind auf DS1 keine trunk ports konfiguriert

```
int f0/1
switchport mode dynamic desirable

int f0/2
switchport mode dynamic desirable

int f0/3
switchport mode dynamic desirable
```

![](20161219_505x353.png)

Alle 3 VTP Clients sind mit dem Sever verbunden. Es besteht kein VTP problem
