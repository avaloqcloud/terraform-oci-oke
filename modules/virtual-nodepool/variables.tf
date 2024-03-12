variable "cluster_id" {
    type = string
}

variable "compartment_ocid" {
    type = string
}

variable "node_pool_name" {
    type = string
}

variable "availabilitydomain" {
    type = string
}

variable "faultdomain" {
   type = list(string)
   #default = [ "FAULT-DOMAIN-1", "FAULT-DOMAIN-2", "FAULT-DOMAIN-3" ]
   #description = "A list of fault domains in which to place nodes."
}

variable "worker_subnet_ocid" {
    type = string
}

variable "pod_configuration_shape" {
    type = string
}

variable "pod_subnet_ocid" {
    type = string
}

variable "size" {
   type  = number
}