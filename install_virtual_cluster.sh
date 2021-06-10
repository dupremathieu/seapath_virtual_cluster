#!/usr/bin/env bash
set -e


if ! [ -f image.qcow2 ] ; then
    echo "Error put your guest-host image here and name it image.qcow2"
    exit 1
fi

if ! which virsh 1>/dev/null 2>&1 ; then
    echo "Error libvirt is needed. Please install the libvirt packages"
    exit 1
fi

if ! systemctl is-active --quiet libvirtd ; then
    echo "libvirtd service is not running"
    echo "systemctl start libvirtd"
    exit 1
fi
sudo virsh net-define network-cluster.xml
sudo virsh net-define network-control.xml
sudo virsh net-define network-vm.xml
sudo virsh net-autostart cluster
sudo virsh net-autostart control
sudo virsh net-autostart vm
sudo virsh net-start cluster
sudo virsh net-start control
sudo virsh net-start vm
sudo virsh define h1.xml
sudo virsh define h2.xml
sudo virsh define observer.xml
sudo ./reinit.sh
