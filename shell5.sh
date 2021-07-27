#!/bin/bash

#Variables - Part two
echo "i was called with $# parameters"
echo "my name is $0"
echo "my first parameter is $1"
echo "my second parameter is $2"
echo "All Parameters are $@"

foo=sun
echo $fooshine
echo ${foo}shine

#variables -Using Default Values
echo -en "What is your name [ 'whoami' ] "
read myname
if [ -z "$myname" ]; then
    myname=`whoami`
fi
echo "Your Name is : $myname" 

#end
