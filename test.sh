#!/bin/bash

qemu-system-x86_64 \
    -cdrom ./packer/assets/install-amd64-minimal-20200205T214502Z.iso \
    -boot order=d -m 1024 \
    -smp cpus=1,sockets=2,maxcpus=2 \
    -drive "file=../../VirtualBox VMs/gentoo_snapshot.cow,format=qcow2,index=1" \
    -device virtio-net,netdev=user.0 \
    -netdev user,id=user.0,hostfwd=tcp::5556-:22


# run playbook on aready running qemu vm
# ansible-playbook -i inventory_test.ini playbook.yml --extra-vars "ssh_pub=$(cat ../id_rsa_qemu) geenrated_user=antoine generated_group=antoine"

