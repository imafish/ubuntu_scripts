#!/bin/bash

tmpfile=/tmp/`date +%s`
if [ -e $tmpfile ]; then
  rm $tmpfile
fi
echo "" >> ${tmpfile}
echo "" >> ${tmpfile}
echo "----------" >> ${tmpfile}
echo "----------" >> ${tmpfile}
echo "RESULTS:" >> ${tmpfile}


./basic.sh ${tmpfile}
./desktop.sh ${tmpfile}

cat ${tmpfile}
rm ${tmpfile}

