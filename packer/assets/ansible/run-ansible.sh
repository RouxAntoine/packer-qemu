#!/bin/bash

# run playbook on aready running qemu vm
ansible-playbook -i inventory_test.ini playbook.yml --extra-vars "ssh_pub=$(cat ../id_rsa_qemu) generated_user=antoine generated_group=antoine"

