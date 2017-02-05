---
title: DWH 5 PortUnix
layout: report
date: 2017-02-05
taskHref: http://griesmayer.com/?menu=Dataware%20House&semester=Semester_5&topic=05_PortUnix
subject: dbi
---

This Course requires that [GenerateTestData](../dwh_3_generateTestData)  was completed earilier

## Step 1: Compile application to jar

**Press ctrl+alt+shift+S**

![](20170205_1026x846.png)

**Artifacts -> + -> Jar -> from Module with dependencies**

Specify the Main Class of your Project

![](20170205_1033x837.png)

Make sure to Specify the java 1.6 runtime enviroment, so it will run in this very up to date virtual maschine. Donload the jdk here [Java 6 JDK & JRE](http://www.oracle.com/technetwork/java/javase/downloads/java-archive-downloads-javase6-419409.html)


**Changeching the Build settings** (Press ctrl+alt+shift+S)

Change Project SDK to 1.6 and language level to 6

![](20170205_1026x846.png)

![](20170205_561x217.png)


**Changeing the Run settings** (Optional for debugging)

![](20170205_1088x800.png)


Then on the Menubar of the Main windows select **build -> build artifact**

![](20170205_236x208.png)

After that, you should have the generated jar file inside out/artifacts/*project_name*_jar/*project_name*.jar

Copy the file to your virtual machine using the shared folder

![](20170205_1205x866.png)

Create a data directory

Make sure to transfer ownership of all created files and folders to the **oracle** user using `chown oracle:oracle filename` and make the jar file executable using `chmod +x jarname.jar`

![](20170205_366x66.png)

Execute the jar file

![](20170205_1004x697.png)

**Done!**
