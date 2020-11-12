.PHONY: up-gentoo

include .env

imagePackerBuilder:
	docker build -t $(REGISTRY_URL)/$(IMAGE_NAME):$(VERSION) ./image

up-gentoo: imagePackerBuilder image/assets/id_rsa_qemu
	docker-compose up --build -d gentoo_packer

exec-gentoo:
	docker-compose exec gentoo_packer bash

down:
	docker-compose down

image/assets/id_rsa_qemu:
	@if [ ! -f "$@" ]; then \
	    ssh-keygen -a 100 -C antoinroux@hotmail.fr -t ed25519 -N "" -b 2048 -q -f $@; \
	fi
