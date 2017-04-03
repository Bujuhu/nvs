---
title: KMU 7 Aufsetzen des Badlands Servers
layout: report
date: 2017-03-23
task:
description: Erfüllung der Aufgabenstellung
subject: nvs
---

# Aufsetzen von Badlands

Um den Server im Unterricht demonstrieren zu können wird Badlands innerhlab einer Virtuellen Maschine erstellt.

Das root passwort wird auf ciscoclass gesetzt. Der SSH Server wird automatisch mit installiert.

Danach wird die Installation voollständig ausgeführt.

Zur einfacheren konfiguration wird auf dem Gerät Webmin installiert

## ssh

SSH wurde bereits bei der Installation vorkonfiguriert. In den Konfigurationsdateien wird der root login aktiviert

![](20170323_751x245.png)


## Webmin

Damit der Server einfacher verwaltet werden kann, wird nach dem selben Prozess der letzen Übung Webmin auf dem Server installiert.

![](20170323_1313x519.png)

## Bind (DNS)

Der DNS Server Bind wird mit dem befehl `apt-get install bind9` installiert.

### Konfiguration

Es wird eine neue Master Zone für die Domain `schreib.at` erstellt.

![](20170323_1355x441.png)

Es werden A Records für den Adressbereich konfiguriert:

![](20170323_1346x514.png)


## LDAP

Die Pakete `slapd ldap-utils ldapscripts` werden installiert.

Das Administrator Passwort wird auf ciscoclass gesetzt

![](20170323_984x320.png)

### Konfiguration

Es wird ein SSL Zertifikat für LDAP generiert

![](20170323_1394x512.png)
