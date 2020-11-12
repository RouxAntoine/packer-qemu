variable "ansible_extra_vars" {
  type    = string
  default = ""
}

variable "ansible_provisioning_playbook" {
  type    = string
  default = "/packer/ansible/playbook.yml"
}

variable "iso_checksum" {
  type    = string
  default = ""
}

variable "iso_url" {
  type    = string
  default = ""
}

variable "ssh_password" {
  type    = string
  default = ""
}

variable "ssh_username" {
  type    = string
  default = ""
}
