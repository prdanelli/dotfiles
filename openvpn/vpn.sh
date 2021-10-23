#!/bin/bash

# To allow openvpn without a sudo password: https://superuser.com/a/399262
#
# Inorder to connect to ProtonVPN via OpenVPN the WIFI DNS must be changed to:
# 8.8.8.8, 8.8.4.4


yellow=#EBCB8B
dir=/home/paul

function openvpn_id() {
	ps -C openvpn -o pid=
}

function current_ip() {
	curl -s https://ifconfig.me
}

function connect() {
	notify-send "OpenVPN" "Connecting..."

	original_ip=$(current_ip)

	sudo openvpn --config $dir/Personal/dotfiles/openvpn/uk.protonvpn.com.udp.ovpn --auth-user-pass $dir/Personal/dotfiles/openvpn/credentials.conf --daemon &

	count=1
	while true
	do
		new_ip=$(current_ip)

		if test "$original_ip" = "$new_ip"; then
			notify-send "OpenVPN" "Still Connecting..."

			if (( "$count" >= 10 )); then
				notify-send "OpenVPN" "Could not connect"
				disconnect
				break
			fi

			count=$((count+1))
			sleep 1;
		else
			notify-send "OpenVPN" "Connected to VPN as ${new_ip}"
			break
		fi
	done
}

function disconnect() {
	if [[ $(openvpn_id) ]]
	then
		sudo pkill openvpn

		notify-send "OpenVPN" "Disconnected from VPN"
	fi
}

toggle() {
	if [[ $(openvpn_id) ]]
	then
		disconnect
	else
		connect
	fi
}

status() {
	if [[ $(openvpn_id) ]]
	then
		echo "connected"
	else
		echo "disconnected"
	fi
}

print() {
	if [[ $(openvpn_id) ]]
	then
		icon=""
	else
		icon=""
	fi

	echo %{u"$yellow"}%{T1}%{F"$yellow"}"$icon"%{T-}%{F-}
}

case "$1" in
	--connect)
		connect &
		;;
	--disconnect)
		disconnect
		;;
	--toggle)
		toggle
		;;
	--current-ip)
		current_ip
		;;
	--openvpn-id)
		openvpn_id
		;;
	--print)
		print
		;;
	--status)
		status
		;;
    *)
		print
		;;
esac

