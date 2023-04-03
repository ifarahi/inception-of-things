
echo "Start master node Script"

curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="--node-ip=192.168.56.110 --flannel-iface=eth1" K3S_KUBECONFIG_MODE="644" sh -

sudo cp /var/lib/rancher/k3s/server/token /home/vagrant/token

sudo chmod 644 /home/vagrant/token

echo "alias k=kubectl" >> $HOME/.bashrc

echo "END master node Script"
