ovs-vsctl add-br br0
ovs-vsctl add-port br0 gre1 -- set interface gre1 type=gre option:remote_ip=YOUR_ip 
brctl addif docker0 br0 
ip link set dev br0 up 
ip link set dev docker0 up 
ip route add 172.17.0.0/16 dev docker0
iptables -t nat -F 
iptables -F 

