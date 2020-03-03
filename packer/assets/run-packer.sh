#!/bin/bash

latest=$(curl -s http://distfiles.gentoo.org/releases/amd64/autobuilds/latest-install-amd64-minimal.txt \
  | grep "^[^#;]" | awk '{print $1}' | cut -d'/' -f1)
SSH_PUB=$(cat ./id_rsa_qemu.pub)

export PACKER_LOG=1; packer build --only=qemu \
	-var version="$latest" \
	-var ssh_username="root" \
	-var ssh_password="toor" \
	-var ssh_pub_key="$SSH_PUB" \
	-force \
	/packer/gentoo.json
