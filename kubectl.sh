#!/usr/bin/env bash
set -x
MAGNUM_CLUSTER_ID=$1
#kubectl config set-credentials peter.pouliot --auth-provider=openstack
#kubectl config set-context --cluster=$MAGNUM_CLUSTER_ID --user=peter.pouliot peter.pouliot@kubernetes
#kubectl config use-context peter.pouliot@kubernetes
# eval $(openstack coe cluster config $MAGNUM_CLUSTER_ID)
openstack coe cluster config $MAGNUM_CLUSTER_ID --dir ./
export KUBECONFIG=./config
kubectl -n cluster_1 get po
#kubectl proxy
