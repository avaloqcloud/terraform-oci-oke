resource "oci_containerengine_virtual_node_pool" "virtual_node_pool" {
    #Required
    cluster_id = var.cluster_id
    compartment_id = var.compartment_ocid
    display_name = var.node_pool_name
    placement_configurations {

        #Required
        availability_domain = var.availabilitydomain
        fault_domain = var.faultdomain
        subnet_id = var.worker_subnet_ocid
    }
    nsg_ids = var.node_nsg_ids
    
    pod_configuration {
        #Required
        shape = var.pod_configuration_shape
        subnet_id = var.pod_subnet_ocid
        nsg_ids = var.pod_nsg_ids
    }

    size = var.size
}