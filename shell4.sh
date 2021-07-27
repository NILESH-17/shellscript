#!/bin/bash

echo "enter a number" 
read X
echo $X


if [ "$X" -lt "7" ]
then
    echo "$X is less than seven"
fi
if [ "$X" -gt "0" ]; then
    echo "$X is more than 0"
fi
[ "$X" -le "7" ] && \
    echo "$X is less than or equal to 7"
[ "$X" -ge "4" ] && \
    echo "$X is greater than or equal to 4"
[ -n "$X" ] && \
    echo "$X is nonzero length"
[ -f "$X" ] && \
    echo "$X is the path of a real file" || \
    echo "No such file: $X"
[ -x "$X" ] && \
    echo "$X is the path of an executable file"

echo "******************************"
echo "-------talk case------------"
#talk [Case]

echo "Please talk to me .. "
while :
do
    read INPUT_STRING
    case $INPUT_STRING in
        hello)
            echo "hello yourself!"
            ;;
        bye)
            echo "See you again!"
            break
            ;;
        *)
            echo "Sorry, I don't Understand"
            ;;
    esac
done
echo
echo "See you later.."

#end
