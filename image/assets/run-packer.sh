#!/bin/bash

if [ "$SOURCE_NAME" = "qemu.gentoo" ]; then
  VERSION=$(curl -s http://distfiles.gentoo.org/releases/amd64/autobuilds/latest-install-amd64-minimal.txt \
    | grep "^[^#;]" | awk '{print $1}' | cut -d'/' -f1)
fi

SSH_PUB=$(cat ./id_rsa_qemu.pub)

export PACKER_LOG=1; packer build --only="$SOURCE_NAME" \
	-var ssh_username="$SSH_LIVE_USERNAME" \
	-var ssh_password="$SSH_LIVE_PASSWORD" \
	-var ansible_extra_vars="$ANSIBLE_EXTRA_VARS ssh_pub=$SSH_PUB" \
	-var ansible_provisioning_playbook="$ANSIBLE_PLAYBOOK" \
	-var iso_checksum="$ISO_CHECKSUM" \
	-var iso_url="$ISO_URL" \
	-on-error="ask" \
	-force \
	/packer/hcl/
