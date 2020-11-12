source "qemu" "gentoo" {
  accelerator        = "kvm"
  boot_command       = [
    "gentoo-nofb", "<enter>",
    "<wait5>", "<enter>",
    "<wait15s>", "passwd ${var.ssh_username}", "<enter>",
    "<wait>", "${var.ssh_password}", "<enter>",
    "<wait>", "${var.ssh_password}", "<enter>",
    "<wait>", "sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config", "<enter>",
    "<wait>", "echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config", "<enter>",
    "<wait>", "/etc/init.d/sshd start", "<enter>",
    "<wait>"
  ]
  boot_wait          = "3s"
  cpus               = 2
  disk_compression   = true
  disk_detect_zeroes = "unmap"
  disk_discard       = "unmap"
  skip_compaction    = false
  disk_image         = false
  use_backing_file   = false
  disk_interface     = "virtio"
  disk_size          = "10G"
  disk_additional_size = ["80G"]
  format             = "qcow2"
  headless           = true
  http_directory     = "/packer/httpdir"
  http_port_max      = 10082
  http_port_min      = 10082
  host_port_min      = 2229
  host_port_max      = 2229
  iso_checksum       = "${var.iso_checksum}"
  iso_url            = "${var.iso_url}"
  memory             = "1024"
  net_device         = "virtio-net"
  output_directory   = "output_qcow2"
  qemuargs           = [
    ["-boot", "b"],
    ["-device", "virtio-rng-pci"]
  ]
  shutdown_command   = "shutdown -P now"
  ssh_password       = "${var.ssh_password}"
  ssh_username       = "${var.ssh_username}"
  ssh_wait_timeout   = "900m"
  vm_name            = "gentoo_packer"
  vnc_port_max       = "5900"
  vnc_port_min       = "5900"
}
