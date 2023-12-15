#!/bin/bash
exec > /var/log/user-data.log 2>&1
echo "Starting user-data script..."

sleep 40s

echo "Now after sleeping , Starting user-data script..."

echo 'export NAME=vio-first-cluster.k8s.local' | sudo tee -a /etc/environment
echo 'export KOPS_STATE_STORE=s3://vios3-state-store' | sudo tee -a /etc/environment


echo "hopefully we added the variables"

curl -Lo kops https://github.com/kubernetes/kops/releases/download/$(curl -s https://api.github.com/repos/kubernetes/kops/releases/latest | grep tag_name | cut -d '"' -f 4)/kops-linux-amd64
chmod +x kops
sudo mv kops /usr/local/bin/kops

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"  

echo "$(cat kubectl.sha256)  kubectl"| sha256sum --check 


sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
updatedb

#see if created properly
echo "$(kubectl version --client)"


# to create cluster
kops create cluster --name=${NAME}  --cloud=aws  --zones=eu-central-1a,eu-central-1b,eu-central-1c   --discovery-store=${KOPS_STATE_STORE}/${NAME}/discovery

#to see the default instance group that kops created
kops get ig --name $NAME

