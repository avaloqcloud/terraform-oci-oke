resource "oci_containerengine_cluster" "cluster" {
    #Required
    compartment_id = var.compartment_ocid
    kubernetes_version = var.cluster_kubernetes_version
    name = var.cluster_name
    vcn_id = var.vcn_id

    #Optional
    cluster_pod_network_options {
        cni_type = var.cni_type 
    }

    #defined_tags = {"Operations.CostCenter"= "42"}

    endpoint_config {

        #Optional
        is_public_ip_enabled = var.is_public_ip_enabled
        #nsg_ids = var.cluster_endpoint_config_nsg_ids
        subnet_id = var.control_plane_subnet_id
    }

  options {

    add_ons {
      is_kubernetes_dashboard_enabled = true
      is_tiller_enabled               = false
    }

    admission_controller_options {
      is_pod_security_policy_enabled = false
    }

    kubernetes_network_config {
      pods_cidr     = var.pods_cidr
      services_cidr = var.services_cidr
    }

    /* persistent_volume_config {
      defined_tags  = var.persistent_volume_defined_tags
      freeform_tags = var.persistent_volume_freeform_tags
    }

    service_lb_config {
      defined_tags  = var.service_lb_defined_tags
      freeform_tags = var.service_lb_freeform_tags
    } */

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