# swap off
echo "swap off"
swapoff -a
sed -i 's@/swap.img@# /swap.img@' /etc/fstab

# other rke requirements
echo "rke requirements"
modprobe br-netfilter
echo "net.bridge.bridge-nf-call-iptables=1" >> /etc/sysctl.conf
sysctl -p /etc/sysctl.conf
echo "AllowTcpForwarding yes" >> /etc/ssh/sshd_config