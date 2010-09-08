#!/bin/bash

if [ $# -ne 3 ]
then
  echo "Usage: `basename $0` {doc prefix} {start} {end}"
  exit 1
fi

#DIR_NAME=`date +"%Y-%m-%d_%H_%M_%S"`
DIR_NAME=$1_$2_$3

PREFIX=$1

echo "Making directory "$DIR_NAME
mkdir $DIR_NAME

PSD_DATE=`date --date "$date 10 days" +"%d/%m/%Y"`

FILE_NAME=$1_$2_$3

csvFile=$DIR_NAME/$FILE_NAME.csv
echo "\"Document No\",\"Revision\",\"Title\",\"Type\",\"Status\",\"Discipline\",\"Attribute\",\"Secondary Attribute\",\"File\",\"Print Size\",\"Scale\",\"Percent Complete\",\"Reference\",\"Date Created\",\"Revision Date\",\"Date For Review\",\"Date Reviewed\",\"Date To Client\",\"Date Approved\",\"Authorised by\",\"Author\",\"Comments\",\"Planned Submission Date\",\"Supersede\",,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,," > $csvFile

for i in `seq $2 $3`; 
do
  fn=$DIR_NAME/F$i.txt
  echo $i > $fn
  echo "\""$PREFIX"-"$(printf "%06d" $i)"\",\"A\",\"Test Doc "$i"\",\"Drawing\",\"Draft\",\"Structural\",,,\"F"$i".txt\",,,,,,,,,,,,,,\""$PSD_DATE"\",,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,," >> $csvFile
done

ZIP_NAME=$DIR_NAME/$FILE_NAME.zip

zip -q $ZIP_NAME $DIR_NAME/*.txt

echo "Files created in directory $DIR_NAME"
echo "Zip file is called $ZIP_NAME"
