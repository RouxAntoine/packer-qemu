.PHONY: up


up: packer/assets/id_rsa_qemu
	docker-compose up --build -d

exec:
	docker-compose exec gentoo_packer bash

packer/assets/id_rsa_qemu:
	@if [ ! -f "$@" ]; then \
	    ssh-keygen -a 100 -C antoinroux@hotmail.fr -t ed25519 -N "" -b 2048 -q -f $@; \
	fi
