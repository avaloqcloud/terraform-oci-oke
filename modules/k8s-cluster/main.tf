resource "oci_containerengine_cluster" "cluster" {

    compartment_id = var.compartment_ocid
    kubernetes_version = var.cluster_kubernetes_version
    name = var.cluster_name
    vcn_id = var.vcn_id

    cluster_pod_network_options {
        cni_type = var.cni_type 
    }

    endpoint_config {

        #Optional
        is_public_ip_enabled = var.is_public_ip_enabled
        nsg_ids = var.network_security_group_id
        subnet_id = var.control_plane_subnet_id
    }

  options {

    admission_controller_options {
      is_pod_security_policy_enabled = false
    }

    kubernetes_network_config {
      pods_cidr     = var.pods_cidr
      services_cidr = var.services_cidr
    }

    service_lb_subnet_ids = compact([var.loadbalancer_subnet_ocid])
  }

  type = var.cluster_type
  
  timeouts {
    update = "120m"
  }
}

output "cluster_id" {
    value = oci_containerengine_cluster.cluster.id
  
}