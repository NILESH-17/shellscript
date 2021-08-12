#!/bin/bash

INTERFACES_DIR='/etc/systemd/network'

usage()
{
cat >&2 <<EOF
Usage:
Shell script to take output about Network configuration
options:
    --if-name                Interface will be created according to given interface name.
    --routemetric            Route metrics are used by routing protocols to determine the best paths through your network.
    --gateway                Default Gateway. 
    --destination            Destination-based static routes use the destination network 
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
         --route=*)
            ROUTE_METRIC=${1#--route=}
            [ -n "$ROUTE_METRIC" ] || {
                echo "--route value is missing" >&2
            }
            ROUTE_METRIC=${ROUTE_METRIC,,}
            ;;
        --gateway=*)
            GATEWAY_IP=${1#--gateway=}
            [ -n "$GATEWAY_IP" ] || {
                echo "--gateway value is missing" >&2
            }
            GATEWAY_IP=${GATEWAY_IP,,}
            ;;
        --destination=*)
            DESTINATION=${1#--destination=}
            [ -n "$DESTINATION" ] || {
                echo "destination value is missing" >&2
            }
            DESTINATION=${DESTINATION,,}
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
[DHCP]
RouteMetric=$ROUTE_METRIC
[Network]
DHCP=yes
[Route]
Gateway=$GATEWAY_IP
Destination=$DESTINATION
EOF
        echo "Created"
fi


#end

