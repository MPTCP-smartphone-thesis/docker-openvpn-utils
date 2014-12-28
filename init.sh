source config.sh
docker pull kylemanna/openvpn
docker run --name $OVPN_DATA -v /etc/openvpn busybox
docker run --volumes-from $OVPN_DATA --rm kylemanna/openvpn ovpn_genconfig -u $PROT://$ADDR:$PORT
docker run --volumes-from $OVPN_DATA --rm -it kylemanna/openvpn ovpn_initpki
docker run --volumes-from $OVPN_DATA --rm -i kylemanna/openvpn printf 'cipher none\n' >> /etc/openvpn/openvpn.conf

