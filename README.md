# Packer qemu builder

Run packer into docker container with qemu to build qcow2 gentoo os

## use

run `make up` to start container and build qcow2 

## iso checksum

`iso_checksum_url": "http://distfiles.gentoo.org/releases/amd64/autobuilds/current-install-amd64-minimal/install-amd64-minimal-{{user `version`}}.iso.DIGESTS`