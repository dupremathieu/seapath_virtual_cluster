#!/bin/bash

source_dir=$(dirname "$0")

cd "$source_dir" || exit 1

set -e
sudo ./reset_vms.sh
cd ../ansible
sleep 20
ansible-playbook -i ../cluster-virtual/virtual_cluster.yaml ../cluster-virtual/cluster_setup_main.yaml
