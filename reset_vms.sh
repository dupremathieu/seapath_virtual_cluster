#!/bin/sh

source_dir=$(dirname "$0")

cd "$source_dir" || exit 1

echo "Stop the cluster"
if virsh list | grep -q h1 ; then
    virsh destroy h1
fi
if virsh list | grep -q h2 ; then
    virsh destroy h2
fi
if virsh list | grep -q obs ; then
    virsh destroy obs
fi
mkdir -p /var/lib/libvirt/images
echo create disk
rm -f /var/lib/libvirt/images/cephvol1.qcow2
qemu-img create -f qcow2 /var/lib/libvirt/images/cephvol1.qcow2 50G
rm -f /var/lib/libvirt/images/cephvol2.qcow2
qemu-img create -f qcow2 /var/lib/libvirt/images/cephvol2.qcow2 50G

cp -f ./image.qcow2  /var/lib/libvirt/images/h1.qcow2
cp -f ./image.qcow2  /var/lib/libvirt/images/h2.qcow2
cp -f ./image.qcow2  /var/lib/libvirt/images/obs.qcow2

echo "Start the cluster"
virsh start h1
virsh start h2
virsh start obs
