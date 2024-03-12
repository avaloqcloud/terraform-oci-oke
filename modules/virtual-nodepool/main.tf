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

    #Optional
    #defined_tags = {"Operations.CostCenter"= "42"}
    #freeform_tags = {"Department"= "Finance"}
    #initial_virtual_node_labels {

        #Optional
        #key = var.virtual_node_pool_initial_virtual_node_labels_key
        #value = var.virtual_node_pool_initial_virtual_node_labels_value
    #}
    #nsg_ids = var.virtual_node_pool_nsg_ids
    #Required
    pod_configuration {
        #Required
        shape = var.pod_configuration_shape
        subnet_id = var.pod_subnet_ocid

        #Optional
        #nsg_ids = var.virtual_node_pool_pod_configuration_nsg_ids
    }
    size = var.size
    #Optional
    /*
    taints {

        #Optional
        effect = var.virtual_node_pool_taints_effect
        key = var.virtual_node_pool_taints_key
        value = var.virtual_node_pool_taints_value
    }
    virtual_node_tags {

        #Optional
        defined_tags = {"Operations.CostCenter"= "42"}
        freeform_tags = {"Department"= "Finance"}
    } */
}