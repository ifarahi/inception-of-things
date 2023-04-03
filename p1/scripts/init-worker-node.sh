echo "Start worker node Script"

echo "retrieved token: $(cat /home/vagrant/token)"
token="$(cat /home/vagrant/token)"

curl -sfL https://get.k3s.io | K3S_KUBECONFIG_MODE="644" INSTALL_K3S_EXEC="--node-ip=192.168.56.111 --flannel-iface=eth1" K3S_URL=https://192.168.56.110:6443 K3S_TOKEN=$token sh -

echo "END worker node Script"
