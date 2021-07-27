#!/bin/bash

echo "enter your age"
read age

if [ $age -le 18  ]
then
    echo "you are not allowed to drive"
fi
