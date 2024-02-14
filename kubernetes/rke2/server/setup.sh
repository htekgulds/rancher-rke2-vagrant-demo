# rke server

# get rke2 service
curl -sfL https://get.rke2.io | sh -

# make config
mkdir -p /etc/rancher/rke2
# mkdir -p /var/lib/rancher/rke2/server/manifests/

cp /vagrant/rke2/server/config.yaml /etc/rancher/rke2/
# cp /vagrant/rke2/server/cilium.yaml /var/lib/rancher/rke2/server/manifests/rke2-cilium-config.yaml

NODE_IP=$(ip add | grep eth1 | grep inet | awk '{print $2}' | sed -e 's@/24@@g')
sed -i "s/_NODE_IP_/$NODE_IP/g" /etc/rancher/rke2/config.yaml

# start rke2
systemctl enable rke2-server.service
systemctl start rke2-server.service

export PATH=$PATH:/var/lib/rancher/rke2/bin
export KUBECONFIG=/etc/rancher/rke2/rke2.yaml
