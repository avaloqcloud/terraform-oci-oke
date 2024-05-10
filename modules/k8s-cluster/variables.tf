variable "network_security_group_id" {
  #type = string
  type = list(string)
}
/* 
variable "add_network_security_group" {
  type = bool
  
} */

variable "compartment_id" {
  type        = string
}

variable "cluster_kubernetes_version" {
  type        = string
}

variable "cluster_name" {
  type        = string
}

variable "vcn_id" {
  type        = string
}

variable "cni_type" {
  type        = string
}

variable "is_public_ip_enabled" {
  type        = string
}

variable "control_plane_subnet_id" {
  type        = string
}

variable "loadbalancer_subnet_id" {
  type        = string
}

variable "pods_cidr" {
  type        = string
}

variable "services_cidr" {
  type        = string
}

variable "cluster_type" {
  type = string
}

/* variable "cluster_id" {
    type = string
  
} */

