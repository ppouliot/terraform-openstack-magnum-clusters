variable "external_network_id" {
  description = "The OpenStack network providing Floating IPs"
}

variable "fixed_network_name" {
  description = "The OpenStack Network Name to use"
}

variable "fixed_subnet_name" {
  description = "The OpenStack Network Subnet Name"
}

variable "docker_volume_size" {
  description = "The size of the Docker Volume"
  default     = "5"
}

variable "image" {
  description = "The name of the Glance image to use to create the magnum cluster, typically fedora-atomic or coreos"
  default = "fedora-atomic"
}

variable "flavor_minion" {
  description = "OpenStack image flavor to use for minion instances"
  default = "cloud.minion"
}

variable "flavor_master" {
  description = "OpenStack image flavor to use for minion instances"
  default = "cloud.master"
}

variable "dns_nameserver" {
  description = "DNS Nameserver for the cluster to use"
  default = "1.1.1.1"
}
