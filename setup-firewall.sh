#!/bin/bash
iptables -A INPUT -p udp --dport 51820 -j ACCEPT
iptables -A OUTPUT -p udp --sport 51820 -j ACCEPT
iptables -A INPUT -p tcp --dport 9050 -j ACCEPT
