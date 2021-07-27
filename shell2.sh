#!/bin/bash

#Escape characters
echo "Hello \"World\""
echo "this is \\ a backslash"

#For loop
for i in 1 2 3 4 5
do
echo "looping in number is $i"
done

#While loop
INPUT_STRING=hello
while  [ "$INPUT_STRING" != "bye" ]
do
    echo "Please enter something(bye to quit)"
    read INPUT_STRING
    echo "you typed: $INPUT_STRING"
done

#end
