rm -rf server-ca
rm -rf client-ca
rm -rf controller-ca
mkdir server-ca 
mkdir client-ca 
mkdir controller-ca 
cd server-ca 
openssl  genrsa -out ca.key 2048
openssl req -x509 -new -nodes -key ca.key  -subj "/CN=kyland.com" -days 5000 -out  ca.crt
openssl genrsa -out server.key 2048
openssl req -new -key server.key -subj "/CN=k8s-master" -config ../master_ssl.cnf -out server.csr 
openssl x509 -req -in server.csr -CA ca.crt -CAkey ca.key -CAcreateserial -days 5000 -extensions v3_req -extfile ../master_ssl.cnf -out server.crt

cd ..
cp server-ca/ca.crt client-ca/ 
cp server-ca/ca.key client-ca/ 
cp server-ca/ca.crt controller-ca/ 
cp server-ca/ca.key controller-ca/ 
cd controller-ca/

openssl genrsa -out cs_client.key 2048
openssl req -new -key cs_client.key -subj "/CN=k8s-node-1"  -out cs_client.csr 
openssl x509 -req -in cs_client.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out cs_client.crt -days 5000 

cd ..
cd client-ca/
openssl genrsa -out kubelet_client.key 2048
openssl req -new -key kubelet_client.key -subj "/CN=11.11.1.5" -out kubelet_client.csr 
openssl x509 -req -in kubelet_client.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out kubelet_client.crt -days 5000









