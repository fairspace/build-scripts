#!/bin/sh
for file in $(find . -type f -name "*.sh")
do echo "Checking $file ..."

   if bash -n "$file"
   then echo "  Syntax: OK"
   else echo "  Syntax: error"
        exit 1
   fi

done
