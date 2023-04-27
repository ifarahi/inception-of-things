# install docker - START

apt-get update

apt-get install \
    ca-certificates \
    curl \
    gnupg

install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
chmod a+r /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null

apt-get update

apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

usermod -aG docker vagrant

newgrp docker

# install docker - END

# install k3d - START
# install kubctl - START
wget -q -O - https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | TAG=v5.0.0 bash

k3d cluster create iot-cluster
# TODO - wait for cluster to be ready

# install k3d - END

curl -o /usr/local/bin/kubectl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x /usr/local/bin/kubectl

# install kubctl - END

# install argocd - START

kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

# TODO - wait for argocd to be ready
# install argocd - END


