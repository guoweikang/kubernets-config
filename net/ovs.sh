ovs-vsctl add-br ovs0
brctl addif docker0 ovs0 
ifconfig ovs0 up

ovs-vsctl add-port ovs0 gre0 --  set interface gre0 type=gre options:remote_ip=10.10.1.10

route add -net 172.17.0.0/16 dev docker0  








