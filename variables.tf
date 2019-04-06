# Varibles

variable "enable_template" {
  description = "Enable/Disable Template"
  default = 0
}

variable "template_name" {
  description = "Magnum cluster template name"
  default     = "clustertemplate_1"
}

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

variable "coe" {
  description = "The Magnum OpenStack Cluster Type"
  default = "kubernetes"
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

variable "enable_cluster" {
  description = "Enable/Disable Cluster"
  default     = 0
}

variable "cluster_template_id" {
  description = "Allow for cluster to be used independently"
  default = "${openstack_containerinfra_clustertemplate_v1.clustertemplate_1.id}"
}
variable "cluster_name" {
  description = "Name of the magnum cluster"
  default = "cluster_1"
}
variable "master_count" {
  description = "The number of cluster masters to deploy"
  default = 1
}
variable "node_count" {
  description = "The number of cluster minionss to deploy"
  default = 3
}
