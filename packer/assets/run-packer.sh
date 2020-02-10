#!/bin/bash


#packer build --only=qemu --var outfile=boxen/gentoo-minimal-hyperv.box --var headless=true --var hyperv_switchname=Ethernet gentoo-minimal.json


export PACKER_LOG=1; packer build --only=qemu \
	-var version="20200205T214502Z" \
	-var ssh_username="root" \
	-var ssh_password="toor" \
	/packer/gentoo.json
