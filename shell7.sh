#!/bin/bash

#Quick Reference

#command & && || ^ $ = ! $$ $ ! $1 -eq -ne -lt -le -gt -ge -z -n -nt -d -f -r -w -x
echo "my PID = $$"
echo "script running is $0"
echo "my arguments are $@"
if [ 0 -le 9 ]
then
    echo "o is less than 9"
fi

#Find Factorial of Number
echo "Enter a number"
read num

fact=1

while [ $num -gt 1 ]
do
  fact=$((fact * num))  #fact = fact * num
  num=$((num - 1))      #num = num - 1
done

echo "factorial is $fact"


#***************************************
echo "*************************************"
#print numbers from 1 to 100
i=1
while [ $i -le 100 ]
do
    echo $i
    i=$(($i+1))
done

