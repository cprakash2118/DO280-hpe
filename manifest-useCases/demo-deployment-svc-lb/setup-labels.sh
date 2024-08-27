#!/bin/bash 
check=$1
nodes_name=$(kubectl get nodes | grep k8s | grep worker | awk -F" " '{print $1}')
if [ ${check} == "true" ]
then 
 for node in $nodes_name
  do
   /usr/bin/kubectl label nodes ${node} env=prod
 done
  echo "Label added "env=prod" to the all worker nodes, kindly review !!"
else
 for node1 in $nodes_name
 do
   /usr/bin/kubectl label nodes ${node1} env-
 done
  echo "Label added "env=prod" to the all worker nodes, kindly review !!"
fi
