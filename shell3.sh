#!/bin/bash

#echo what is your name?
#read MY_NAME
#echo "hello $MY_NAME hope you are well"

#while loop in  advance
while read f
do
    case $f in
        hello)   echo English ;;
        namste)  echo Indian  ;;
        *)       echo Unknown Language: $f
                ;;
    esac
done < myfile


