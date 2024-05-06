variable "compartment_ocid" {
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

variable "loadbalancer_subnet_ocid" {
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

variable "defined_tags" {
  type = map(string)
}

variable "freeform_tags" {
  type = map(string)
}
