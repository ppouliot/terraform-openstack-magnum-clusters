#!/usr/bin/env bash

openstack coe cluster template create k8s-cluster \
 --image fedora-atomic \
 --external-network ext-net \
 --dns-nameserver 1.1.1.1 \
 --master-flavor cloud.master \
 --flavor cloud.minion \
 --docker-volume-size 5 \
 --labels 'admission_control_list=NamespaceLifecycle,LimitRanger,ServiceAccount,DefaultStorageClass,DefaultTolerationSeconds,ResourceQuota' \
 --labels 'kubecontroller_options=' \
 --labels 'cert_manager_api=True' \
 --labels 'cgroup_driver=systemd' \
 --labels 'kube_tag=v1.9.3' \
 --fixed-network cpd-dev-network-1 \
 --fixed-subnet cpd-dev-subnet-1 \
 --coe kubernetes \
 --master-lb-enabled \
 --registry-enabled
