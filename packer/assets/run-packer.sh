#!/bin/bash


#packer build --only=qemu --var outfile=boxen/gentoo-minimal-hyperv.box --var headless=true --var hyperv_switchname=Ethernet gentoo-minimal.json

SSH_PUB=$(cat ./id_rsa_qemu.pub)

export PACKER_LOG=1; packer build --only=qemu \
	-var version="20200205T214502Z" \
	-var ssh_username="root" \
	-var ssh_password="toor" \
	-var ssh_pub_key="$SSH_PUB" \
	-force \
	/packer/gentoo.json
