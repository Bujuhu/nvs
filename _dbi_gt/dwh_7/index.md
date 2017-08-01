---
title: DWH 7 LoadMFile
layout: report
date: 2017-02-07
taskHref: http://griesmayer.com/?menu=Dataware%20House&semester=Semester_5&topic=07_LoadMFile
subject: dbi
---

Create a bash script to load multiple files

## project_schreib.sh

```bash
for FILE in `ls data/*.txt`
do
export FILENAME=`basename $FILE`
export FILEBASE=`echo $FILENAME |
sed -e 's/\..*//'`
sqlldr schreib_explain/oracle data=data/$FILEBASE.txt control=data/products_schreib.ldr log=data/log/$FILEBASE.log bad=data/log/$FILEBASE.bad errors=20
done
```

Place the script on the Desktop Folder

```bash
cd Desktop
touch project_schreib.sh
chmod +x project_schreib.sh
```

Open the File in the editor and paste your script into it

Before running the Script, make sure to execute to the count command, so we can prove, that the script actually made a difference

![](20170206_952x839.png)


Then, run the script inside the Desktop directory

```bash
./project_schreib.sh
```

![](20170206_693x739.png)

Lets see if the size of Database entries changed

![](20170206_958x830.png)

And lets have a look if we have new .log and .bad files

![](20170206_703x271.png)
