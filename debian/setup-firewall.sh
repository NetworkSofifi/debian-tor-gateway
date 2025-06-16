kfilter
:INPUT DROP [32:8850]
:FORWARD DROP [0:0]
:OUTPUT DROP [3:252]
-A INPUT -і 10 -j ACCEPT
-A INPUT -m conntrack --ctstate RELATED, ESTABLISHED -j ACCEPT
-A INPUT -p udp -m udp --dport 51820 -j ACCEPT
-A INPUT -p tcp -m tcp --dport 9050 -j ACCEPT
-A OUTPUT -0 lo -j ACCEPT
-A OUTPUT -m conntrack --ctstate RELATED, ESTABLISHED -j ACCEPT
-A OUTPUT -0 enp0s1 -p tcp -m multiport --dports 9050,9051,9001,443,80 -j ACCEPT
-A OUTPUT -0 enp0s1 -p udp -m udp --dport 53 -j ACCEPT
-A OUTPUT -0 enp0s1 -p tcp -m top --tcp-flags FIN,SYN,RST,ACK SYN -j ACCEPT
-A OUTPUT -p udp -m udp --sport 51820 -j ACCET
COMMIT

*nat
:PREROUTING ACCEPT [32:8850]
:INPUT ACCEPT [0:0]
:OUTPUT ACCEPT [6:432]
:POSTROUTING ACCEPT [0:0]
-A POSTROUTING -o enp0s1 -j MASQUERADE
COMMIT
