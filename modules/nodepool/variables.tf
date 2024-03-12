############# Node Pool Variables ##############

variable "node_pool_name" {
   type        = string
}

variable "compartment_ocid" {
   type        = string
}

variable "cluster_kubernetes_version" {
   type = string
}

variable "cni_type" {
   type = string
}

variable "image_id" {
   type        = string
}

variable "node_shape" {
   type        = string
}

variable "availabilitydomain" {
   type        = string
}

variable "worker_subnet_ocid" {
   type        = string
}

variable "faultdomain" {
   type = list(string)
   #default = [ "FAULT-DOMAIN-1", "FAULT-DOMAIN-2", "FAULT-DOMAIN-3" ]
   #description = "A list of fault domains in which to place nodes."
}

variable "size" {
   type        = number
}

variable "max_pods_per_node" {
   type        = number
}

variable "pod_subnet_ocid" {
   type        = string
}

variable "memory" {
   type        = number
}

variable "ocpus" {
   type        = number
}

variable "ssh_public_key" {
   type        = string
}

variable "node_type" {
   type = string
  
}

variable "pod_configuration_shape" {
   type = string
   #default = "Pod.Standard.E3.Flex"
  
}

variable "cluster_id" {
   type = string
}