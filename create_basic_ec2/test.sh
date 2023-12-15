#!/bin/bash
exec > /var/log/user-data.log 2>&1
echo "Starting user-data script..."

sleep 40s

echo "Now after sleeping , Starting user-data script..."

echo 'export NAME=vio-first-cluster.k8s.local' | sudo tee -a /etc/environment
echo 'export KOPS_STATE_STORE=s3://vios3-state-store' | sudo tee -a /etc/environment


echo "hopefully we added the variables"