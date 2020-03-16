#!/bin/sh

# MSS clamp to circumvent issues with Path MTU Discovery
iptables -A FORWARD -p tcp --tcp-flags SYN,RST SYN -j TCPMSS --clamp-mss-to-pmtu

# Forward all traffic from the internal network to the eth0 device and mask with the eth0 external IP address
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
