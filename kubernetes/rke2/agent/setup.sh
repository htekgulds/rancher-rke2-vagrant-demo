# rke server

# get rke2 service as agent
curl -sfL https://get.rke2.io | INSTALL_RKE2_TYPE="agent" sh -

# make config
mkdir -p /etc/rancher/rke2

cp /vagrant/rke2/agent/config.yaml /etc/rancher/rke2/

NODE_IP=$(ip add | grep eth1 | grep inet | awk '{print $2}' | sed -e 's@/24@@g')
sed -i "s/_NODE_IP_/$NODE_IP/g" /etc/rancher/rke2/config.yaml

# start rke2
systemctl enable rke2-agent.service
systemctl start rke2-agent.service