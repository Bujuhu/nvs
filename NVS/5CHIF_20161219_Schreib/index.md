---
title: PT 4.4 4.5
layout: report
date: 2016-12-19
task:
description: Erfüllung der Aufgabenstellung
subject: nvs
---

# 4.4 Configure and Verify eBGP

## Testen

Um zu testen, ob der ISP den Router richtig konfiguriert hat wird er *ISP-Entry2* von *OtherCo1* angepingt.

![](20170101_466x109.png)

Es wird getestet ob ein Gerät in ACME *172.16.10.2* anpingen kann. Dies sollte noch nicht funktionieren.

![](20170101_357x80.png)

## Konfiguriern

### Konfiguration bei ACME1
```
router bgp 65001
neighbor 1.1.1.1 remote-as 65003
network 192.168.0.0 mask 255.255.255.0
```

![](20170101_520x76.png)


### Konfiguration bei OtherCo1

```
router bgp 65002
neighbor 1.1.1.9 remote-as 65003
network 172.16.10.0 mask 255.255.255.0
```

### Kontrolle

![](20170101_597x211.png)

![](20170101_597x211.png)

![](20170101_544x283.png)

![](20170101_490x105.png)



# 4.5 Troubleshooting IPv6 ACLs

## Troubleshoot HTTP Access

### HTTP Tests bei L0, L1 und L2

Es wird versucht mit den Geräten L0, L1 und L2 eine HTTP Verbindung zu Server1 und Server2 herzustellen:

**Erwartetes Ergebnis**

L0 sollte sich mit keinem Server verbinden. L1 und L2 mit beiden.

**Ergebnis bei L0:**

![](20170101_599x84.png)

![](20170101_383x166.png)


**Ergebnis bei L1:**

![](20170101_480x331.png)

![](20170101_619x322.png)

**Ergebnis bei L2:**

![](20170101_640x308.png)

![](20170101_620x373.png)


**Die durchgeführten Tests sind ident mit dem erwarteten Ergebnis.**

####ICMP Test bei L0
Es wird getestet, ob L0 Server1 und Server2 anpingen kann. Das zu erwartende Ergebnis ist Ja.

![](20170101_457x363.png)

**Der Ping hat nicht funktioniert.**

### HTTPS Test bei PC0

Es wird getestet ob PC0 auf die https Diesnte auf Server1 und Server2 zugreifen kann. Das Erwartete Ergebnis ist, es funktioniert.

![](20170101_610x118.png)

![](20170101_625x169.png)

### ACL Konfiguration von R1

![](20170101_432x126.png)

Es fehlt das permit ipv6 any any kommando. Ansonsten wird sämtlicher Traffic von der ACL konfiguration blockiert.

#### Fehlerbehebung

```
ipv6 access-list G0-ACCESS
permit ipv6 any any
```

![](20170101_301x49.png)

## Troubleshoot FTP Access

### Testen
L1 sollte keine Verbindung zum FTP Server herstellen können, die restlichen Geräte schon

**L0**

![](20170101_261x64.png)

**L1**

![](20170101_275x73.png)

**L2**

![](20170101_271x57.png)

**L1 kann unerwarteter weiße eine FTP verbindung herstellen**

### Fehlerbehebung

Die ACL `G1-ACCESS` ist am Interface fälschlicher weiße als outbound und nicht inbound konfiguriert.

```
int g0/1
no ipv6 traffic-filter G1-ACCESS out
ipv6 traffic-filter G1-ACCESS in

```

![](20170101_478x518.png)


### Testen

![](20170101_351x56.png)

L1 kann nun keine FTP verbindung mehr zum Server herstellen.


## Troubelshoot SSH Access

Schon bei der Inspektion der ACl Konfiguration, ist aufgefallen, dass das `permit ipv6 any any` kommando an erster stelle steht und damit sämtlicher Traffic durch dieses ACl durchgelassen wird.

#### Fehlerbehebung

```
ipv6 access-list G2-ACCESS
no permit ipv6 any any
permit ipv6 any any
```

![](20170101_315x47.png)

#### Testen

**PC0**

![](20170101_269x114.png)

**L0**

![](20170101_259x49.png)

**L1**

![](20170101_251x43.png)

**L2**

![](20170101_359x51.png)

Nachdem SSH auf dem Router richtig kongiguriert wird, können die Geräte sich erwatungsweiße mit dem Router verbinden.
