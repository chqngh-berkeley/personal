#!/bin/bash

COUNTER=100
DEST_FILE=/data/testtest/weatherdata
DEST_FILE_COUNT=1
touch "$DEST_FILE.$DEST_FILE_COUNT.csv"

for f in /data/historical_daily/*.csv;
do
   tail -n +2 "$f" > "$f.tmp"
   cat "$f.tmp" >> "$DEST_FILE.$DEST_FILE_COUNT.csv"
   rm "$f.tmp"
   if [ "$COUNTER" -eq 0 ]
   then
     $COUNTER=100
     let DEST_FILE_COUNT+=1
     touch "$DEST_FILE.$DEST_FILE_COUNT.csv"
   else
     let COUNTER-=1
   fi
   if [$DEST_FILE_COUNT -eq 5]
   then
     break
   fi
done
