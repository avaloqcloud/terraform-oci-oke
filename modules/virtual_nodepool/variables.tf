variable "cluster_id" {
    type = string
}

variable "compartment_id" {
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

variable "worker_subnet_id" {
    type = string
}

variable "pod_configuration_shape" {
    type = string
}

variable "pod_subnet_id" {
    type = string
}

variable "size" {
   type  = number
}

variable "defined_tags" {
  type = map(string)
}

variable "freeform_tags" {
  type = map(string)
}