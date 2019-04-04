resource "openstack_compute_keypair_v2" "magnum" {
  name = "magnum"
}

output "Magnum Public Key:" {
  value = "${openstack_compute_keypair_v2.magnum.public_key}"
}

output "Magnum Private Key:" {
  value = "${openstack_compute_keypair_v2.magnum.private_key}"
}

resource "openstack_containerinfra_clustertemplate_v1" "clustertemplate_1" {
  name                  = "clustertemplate_1"
  image                 = "${var.image}"
  coe                   = "kubernetes"
  flavor                = "${var.flavor_minion}"
  master_flavor         = "${var.flavor_master}"
  dns_nameserver        = "${var.dns_nameserver}""
  external_network_id   = "${var.external_network_id}"
  fixed_network         = "${var.fixed_network_name}"
  fixed_subnet          = "${var.fixed_subnet_name}"c
  docker_storage_driver = "devicemapper"
  docker_volume_size    =${var.docker_volume_size}" 
  network_driver        = "flannel"
  master_lb_enabled     = true
  floating_ip_enabled   = true

  labels = {
    kube_tag                         = "v1.9.1"
    kube_dashboard_enabled           = "true"
    prometheus_monitoring            = "false"
    influx_grafana_dashboard_enabled = "false"
    admission_control_list           = "NamespaceLifecycle,LimitRanger,ServiceAccount,DefaultStorageClass,DefaultTolerationSeconds,ResourceQuota"
    kubecontroller_options           = ""
    cert_manager_api                 = "True"
    cgroup_driver                    = "systemd"
  }
}
output "Cluster Template ID" {
  value = "${openstack_containerinfra_clustertemplate_v1.clustertemplate_1.id}"
}

resource "openstack_containerinfra_cluster_v1" "cluster_1" {
  name                 = "cluster_1"
  cluster_template_id  = "${openstack_containerinfra_clustertemplate_v1.clustertemplate_1.id}"
  master_count         = 1
  node_count           = 2
  keypair              = "magnum"
}
