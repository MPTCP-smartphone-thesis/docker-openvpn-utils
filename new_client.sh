[ "$1" = "" ] && echo "No given client name for the first arg" && exit 1
CLIENTNAME="$1"

source ./config.sh
docker run --volumes-from $OVPN_DATA --rm -it kylemanna/openvpn easyrsa build-client-full $CLIENTNAME nopass
docker run --volumes-from $OVPN_DATA --rm kylemanna/openvpn ovpn_getclient $CLIENTNAME > $CLIENTNAME.ovpn
