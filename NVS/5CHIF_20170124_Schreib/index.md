---
title: KMU 2 Backup & Betriebssysteme
layout: report
date: 2017-01-24
task:
description: Erfüllung der Aufgabenstellung
subject: nvs
---

Während dieser Übung werden die Betriebssysteme Linux Mint und Debian heruntergeladen.

## Backup

Für ein externes Backup können verschiedene billige Cloudspeicherprovider genutzt werden.

- [Amazon Glaicer](https://www.backblaze.com/b2/cloud-storage.html)
- [Tarsnap](https://www.tarsnap.com/)
- [Google Nearline](https://cloud.google.com/storage/docs/storage-classes#nearline)
- [Backblaze B2](https://www.backblaze.com/b2/cloud-storage.html)

Zurzeit wird Amazon Glaicer, aufgrund des günstigen Preises bevorzugt. Sollte das Datenvolumen allerdings eine gewisse Größe nicht überschreiten, würde tarsnap ausreichen, da dies von haus aus verschlüsselt ist und somit nicht mehr Zeit aufgewendet werden muss, eine Backupanwedung, welche automatisch verschlüsselt, aufzusetzen und zu verwalten.

Da im Testsetup noch keine Daten gesichert werden müssen, wird Tarsnap im **--dry-run --print-stats** Modus genutzt. Dabei wird kein richtiges Backuo erstellt, sonder nur die größe und die Kosten, die das erstelle Archiv nutzen würde gemessen.

Ein Testwerkzeug dieser Form existiert bei andren Anbietern leider nicht.

Backups werden auf allen Servern stündlich erstellt.

## Betriebssystemauswahl

Zu beginn werden nur 2 Betriebssysteme verwendet

### Debian (Serverbetriebssystem)

Auf allen Unternehmensserven wird Debian Jessie 8.7 installiert. Folgende Eigenschaften begünstigen die Verwendung von Debian gegenüber anderen Betriebssystemen

- Lange Updatecyclen (nur sicherheitsaktualisierungen werden sofort zur verfügung gestellt)
- Aufwändiger Produkttestcyclus
- Hohe kompatbilität mit anderer Software
- Minimales Betriebssystem mit wenig vorinstallierten überflüssigen Werkzeugen
- Hohe performance
- Kostenfrei
- Linux basierend und somit leicht ins Unternehmen eingleiderbar

### Linux Mint (Endnutzerbetriebssystem)

Linux Mint in Version 18.1 64bit in der Cinnamon Variante wird auf allen Desktop Unternehemnsgeräten vorinstalliert. Durch folgende Eigenschaften hebt sich Linux Mint von den Konkurrenzprodukten ab:

- Einfache, an Windows angelehnte Grafische Benutzeroberfläche
- Am häufigsten genutzes Desktop Betriebssystem
- Meisten wichtigen Werkzeuge sind bereits vorinstalliert
- Kostenfrei
- Linux basierend und somit leicht ins Unternehmen eingleiderbar

Sollten Mitarbeiter ein anderes Betriebssystem zur Arbeit bevorzugen, ist ihnen erlaubt ihr eigenes Gerät zur Arbeit mitzunehmen und im Unternehmenswlan oder über VPN zu nutzen. Allerdings wird dieses Gerät nicht von der Unternehmens-Systemadministration verwaltet.

Sprich, der Mitarbeiter ist selbst dafür verantworlich, sein Gerät sicher und aktuell zu halten, sowie die Unternehmensdaten zu schützen.
