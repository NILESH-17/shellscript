#!/bin/bash

INTERFACES_DIR='/etc/systemd/network'

usage()
{
cat >&2 <<EOF
Shell script to take output about Network configuration
    --if-name                Interface will be created according to given interface name.

EOF
}

while [ -n "$1" ];
do
    case "$1" in
        -h|--help)      usage; exit 0 ;;
         --if-name=*)
            INTERFACE_NAME=${1#--if-name=}
            [ -n "$INTERFACE_NAME" ] || {
                echo "--if-name value is missing" >&2
                exit 1
            }
            INTERFACE_NAME=${INTERFACE_NAME,,}
            ;;
    esac
    shift
done

if [ -e "${INTERFACES_DIR}/${INTERFACE_NAME}.network" ]; then
        read -p  "INTERFACE NAME ${INTERFACE_NAME} is already exists. Press Yes|y|Y to see Conf file: " ANSWER
        case "$ANSWER" in
            [yY][eE][sS] | [y] | [Y])
                echo "********************************"
                cat "${INTERFACES_DIR}/${INTERFACE_NAME}.network"
                ;;
            *)
                exit
        esac
elif [ -n "${INTERFACES_DIR}/${INTERFACE_NAME}.network" ]; then
        echo "${INTERFACE_NAME} INTERFACE does not exists"
        echo "creating new Interface for : ${INTERFACE_NAME}"
        cat > "${INTERFACES_DIR}/${INTERFACE_NAME}.network" <<EOF
[Match]
Name=$INTERFACE_NAME
[Network]
DHCP=yes
EOF
        echo "Created"
fi


#end

