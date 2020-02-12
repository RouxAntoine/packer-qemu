#!/bin/bash

qemu-system-x86_64 -cdrom ./packer/assets/install-amd64-minimal-20200205T214502Z.iso -boot order=b -m 1024 -smp cpus=1,cores=4
