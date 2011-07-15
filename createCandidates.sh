#! /bin/bash

for i in `ls $1`
do 
  echo $i | awk -F '.' '{print $1}' | sed -e 's/^/'"$1"'\//' | sed -e 's/$/_'"$2"'.txt/' | xargs touch; 
done
