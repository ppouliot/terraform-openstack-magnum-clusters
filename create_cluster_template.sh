#!/usr/bin/env bash

openstack coe cluster template create k8s-cluster \
 --image fedora-atomic-29-aarch64-qcow2 \
 --external-network public1-subnet \
 --dns-nameserver 1.1.1.1 \
 --master-flavor m1.large \
 --flavor m1.medium \
 --labels 'admission_control_list=NamespaceLifecycle,LimitRanger,ServiceAccount,DefaultStorageClass,DefaultTolerationSeconds,ResourceQuota' \
 --labels 'kubecontroller_options=' \
 --labels 'cert_manager_api=True' \
 --labels 'cgroup_driver=systemd' \
 --labels 'kube_tag=v1.9.3' \
 --fixed-network demo-net \
 --fixed-subnet demo-subnet \
 --coe kubernetes \
 --master-lb-enabled \
 --registry-enabled
# --docker-volume-size 5 \
