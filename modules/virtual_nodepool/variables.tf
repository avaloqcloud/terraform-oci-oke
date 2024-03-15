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