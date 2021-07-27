#!/bin/bash

# A simple script with a function

add_a_user()
{
    echo "what is your name?"
    read myname
    echo city name? 
    read cityname
    shift; shift;
    COMMENTS=$@
    echo "adding user $myname from city $cityname"
}

#-----------------
echo "Start of Script"
add_a_user 
echo "successfully added a new user"
