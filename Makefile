.PHONY: up


up: ssh
	docker-compose up --build -d

exec:
	docker-compose exec gentoo_packer bash

ssh: packer/assets/id_rsa_qemu packer/assets/id_rsa_qemu.pub
	@if [ ! -f $< ]; then \
	    ssh-keygen -a 100 -C antoinroux@hotmail.fr -t ed25519 -N "" -b 2048 -q -f $<; \
	fi
