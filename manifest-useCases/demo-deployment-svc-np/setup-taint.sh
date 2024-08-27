#!/bin/bash 
check=$1
nodes_name=$(kubectl get nodes | grep k8s | grep worker | awk -F" " '{print $1}')
if [ ${check} == "true" ]
then 
 for node in $nodes_name
  do
   /usr/bin/kubectl taint node  ${node} key1=value1:NoSchedule
 done
  echo "Taint added to the all worker nodes, kindly review !!"
else
 for node1 in $nodes_name
 do
  /usr/bin/kubectl taint node ${node1} key1=value1:NoSchedule-
 done
  echo "Taint added to the all worker nodes, kindly review !!"
fi
