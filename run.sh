source ./config.sh
docker run --volumes-from $OVPN_DATA --name openvpn -d -p $PORT:1194/$PROT --cap-add=NET_ADMIN kylemanna/openvpn
