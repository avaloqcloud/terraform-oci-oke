resource "oci_containerengine_virtual_node_pool" "virtual_node_pool" {
    #Required
    cluster_id = var.cluster_id
    compartment_id = var.compartment_id
    display_name = var.node_pool_name
    placement_configurations {

        #Required
        availability_domain = var.availabilitydomain
        fault_domain = var.faultdomain
        subnet_id = var.worker_subnet_id
    }

    defined_tags  = var.defined_tags
    freeform_tags = var.freeform_tags

    pod_configuration {
        #Required
        shape = var.pod_configuration_shape
        subnet_id = var.pod_subnet_id

    }
    size = var.size

    virtual_node_tags {

        #Optional
        defined_tags  = var.defined_tags
        freeform_tags = var.freeform_tags
    }

}