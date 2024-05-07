resource "oci_containerengine_node_pool" "node_pool" {
  count = var.node_type == "Managed" ? 1 : 0
  #condition = each.value.enabled

  name               = var.node_pool_name
  cluster_id         = var.cluster_id
  compartment_id     = var.compartment_id
  kubernetes_version = var.cluster_kubernetes_version

  node_shape = var.node_shape
  node_source_details {
    image_id    = var.image_id
    source_type = "IMAGE"
  }

  node_config_details {
    placement_configs {
      availability_domain = var.availabilitydomain
      subnet_id           = var.worker_subnet_id
      fault_domains       = var.faultdomain
    }
    size = var.size

    node_pool_pod_network_option_details {
      cni_type          = var.cni_type
      max_pods_per_node = var.max_pods_per_node
      pod_subnet_ids    = [var.pod_subnet_id]
    }
    
    defined_tags  = var.defined_tags
    freeform_tags = var.freeform_tags
  }

  node_shape_config {
    ocpus         = var.ocpus
    memory_in_gbs = var.memory
  }

  ssh_public_key = var.ssh_public_key

  defined_tags  = var.defined_tags
  freeform_tags = var.freeform_tags

}
