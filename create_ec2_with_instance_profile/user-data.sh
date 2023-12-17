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
kops get ig --name ${NAME}

echo "#Build the Cluster 
#Now we take the final step of actually building the cluster. This'll take a while. 
#Once it finishes you'll have to wait longer while the booted instances finish downloading Kubernetes components
# and reach a "ready" state. the default being admin time is 18 hours, we can set it to something else, like 10 years of admin access..."

# kops update cluster --name ${NAME} --yes --admin=87600h

# sleep 120s

# echo "below command is run to change the config of kubectl so that it picks up the admin privileges"
# kops export kubecfg --admin=87600h

# echo "Remember when you installed kubectl earlier? 
# The configuration for your cluster was automatically generated and written to ~/.kube/config for you!
# A simple Kubernetes API call can be used to check if the API is online and listening.
# Let's use kubectl to check the nodes."

# kubectl get nodes


# echo "kops also ships with a handy validation tool that can be ran to ensure your cluster is working as expected."
# kops validate cluster --wait 10m


# echo "You can look at all system components with the following command."
# kubectl -n kube-system get po
