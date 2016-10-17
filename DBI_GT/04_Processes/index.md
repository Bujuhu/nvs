---
title: 4 Processes
layout: report
date: 2016-10-10
task: Processes Uebung_001
taskHref: http://griesmayer.com/?menu=Oracle&semester=Semester_3&topic=04_Processes
subject: dbi
---
## System Monitor (SMON)
- Performing instance recovery, if necessary, at instance startup.
- Recovering terminated transactions that were skipped during instance recovery because of file-read or tablespace offline errors.
- SMON recovers the transactions when the tablespace or file is brought back online.
- Cleaning up unused temporary segments.

## Process Monitor (PMON)
- Monitors other background processes and performs process recovery when a server or dispatcher process terminates abnormally.
- Responsible for cleaning up the database buffer cache and freeing resources that the client process was using.

## Database Writer (DBWR)
Writes modified block inside the cache back to the harddrive

## Log Writer (LGWR)
Writes redo log entries to the online redo log (after a complet transaction)

## Archiver (ARCn)
Copies the online redo log to offline storage (harddrive)
