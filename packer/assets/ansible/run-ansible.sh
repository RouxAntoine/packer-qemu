#!/bin/bash

PLAYBOOK="${1:-playbook.yml}"
#DEBUG="-vvv"
TAGS="--tags configure"

# run playbook on aready running qemu vm
ansible-playbook $DEBUG -i inventory_test.ini $TAGS --extra-vars "ssh_pub=$(cat ../id_rsa_qemu) generated_user=antoine generated_group=antoine" $PLAYBOOK
