# "timestamp" template function replacement
locals { timestamp = regex_replace(timestamp(), "[- TZ:]", "") }

build {
  sources = ["source.qemu.gentoo"]

  provisioner "ansible" {
    ansible_env_vars = ["ANSIBLE_CONFIG=/packer/ansible/ansible.cfg"]
    extra_arguments  = ["--extra-vars", "${var.ansible_extra_vars}"]
    groups           = ["default"]
    playbook_file    = "${var.ansible_provisioning_playbook}"
    user             = "root"
  }
}
