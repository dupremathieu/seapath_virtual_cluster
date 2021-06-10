# SEAPATH Virtual Cluster
SEAPATH Virtual Cluster is a project to create and initialize a virtual [SEAPATH cluster](https://github.com/seapath/yocto-bsp).

## Prerequisites
* QEMU/KVM and libvirt has to be installed.
* A SEAPATH guest_host image must be placed in the project root directory and must be renamed *image.qcow2*
* A SEAPATH guest image must be placed in the project root directory and must be renamed *guest.qcow2*
* The SEAPATH Ansible repository (https://github.com/seapath/ansible) must be installed and place in the parent directory
* All prerequisites from the SEAPATH Ansible repository must be done

## First time installation
* Call the script `./install_virtual_cluster.sh`

## Add a VM
 
* Run the playbook *add_vm.yaml* in the *ansible* directory : `ansible-playbook -i ../cluster-virtual/virtual_cluster.yaml ../cluster-virtual/add_vm.yaml`

## Updating / Resetting Hypervisors
* Replace *image.qcow2* with the updating hypervisor image
* Run the script: `./reinit.sh`
