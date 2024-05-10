############### Cluster Variables ##########

variable "compartment_id" {
  type        = string
}

variable "cluster_kubernetes_version" {
  type        = string
  default     = "v1.27.2"
}

variable "cluster_type" {
  default     = "basic"
  description = "The cluster type: basic or enhanced. See <a href=https://docs.oracle.com/en-us/iaas/Content/ContEng/Tasks/contengworkingwithenhancedclusters.htm>Working with Enhanced Clusters and Basic Clusters</a> for more information."
  type        = string
  validation {
    condition     = contains(["basic", "enhanced"], lower(var.cluster_type))
    error_message = "Accepted values are 'basic' or 'enhanced'."
  }
}

variable "cni_type" {
  type = string
  default = "OCI_VCN_IP_NATIVE"
  description = "The CNI for the cluster: FLANNEL_OVERLAY or OCI_VCN_IP_NATIVE"
}

variable "pods_cidr" {
  default     = "10.244.0.0/16"
  description = "The CIDR range used for IP addresses by the pods. A /16 CIDR is generally sufficient. This CIDR should not overlap with any subnet range in the VCN (it can also be outside the VCN CIDR range). Ignored when cni_type = 'npn'."
  type        = string
}

variable "services_cidr" {
  default     = "10.96.0.0/16"
  description = "The CIDR range used within the cluster by Kubernetes services (ClusterIPs). This CIDR should not overlap with the VCN CIDR range."
  type        = string
}

variable "is_public_ip_enabled" {
  default     = false
  description = "Whether the Kubernetes control plane endpoint should be allocated a public IP address to enable access over public internet."
  type        = bool
}

variable "cluster_name" {
  default     = "oke"
  description = "The name of oke cluster."
  type        = string
}

variable "vcn_id" {
  type        = string
  description = "The id of the virtual cloud network (VCN) in which to create the cluster."
}

variable "control_plane_subnet_id" {
  type        = string
  description = "The id of the regional subnet in which to place the Cluster endpoint."
}

variable "loadbalancer_subnet_id" {
  type        = string
  description = "The ids of the subnets used for Kubernetes services load balancers."
} 

variable "add_network_security_group" {
  type = bool
  default = false
  description = "A list of the ids of the network security groups (NSGs) to apply to the cluster endpoint"
}

variable "network_security_group_id" {
  type = list(string)
  default = [ "id1.networksecuritygroup.oc1.eu-zurich-1.aaaaaaaauakjbdvmidlhozifxul7zepgybhtt2afdk4wmtzzptadvh5ti5va" ]
}

variable "node_type" {
   #type = string
   type = string
   default = "Managed"
   description = "The type of the node pool: Managed or Virtual"
}

variable "addon_name" {
  type = list(string)
  default = [ "none" ]
  description = "Add-on management is only supported on enhaned cluster types. Supported list of add-ons: KubernetesDashboard, CertManager, CoreDNS, Istio, KubeProxy, WeblogicKubernetesOperator"
}

############## NodeGroup Variables ##################

variable "nodepool" {
  type = map(object({
    node_pool_name = string,
    image_id = string,
    node_shape = string,
    availabilitydomain = string,
    worker_subnet_id = string,
    faultdomain = list(string),
    size = number,
    max_pods_per_node = number,
    pod_subnet_id = string,
    memory = number,
    ocpus = number,
    ssh_public_key = string,
    node_nsg_ids = list(string),
    pod_nsg_ids = list(string)
  }))
  default = {
    "nodepool" = {
      node_pool_name = "managed-nodepool",
      image_id = "id1.image.oc1.eu-zurich-1.aaaaaaaa4gholoh5cndh6fxhm4nsbnrfyrtpy6wbnkablzhg2xjfw2iutq7q",
      node_shape = "VM.Standard.E3.Flex",
      availabilitydomain = "Wfog:EU-ZURICH-1-AD-1",
      faultdomain = [ "FAULT-DOMAIN-1", "FAULT-DOMAIN-2", "FAULT-DOMAIN-3" ],
      size = 2,
      max_pods_per_node = 67,
      memory = 32,
      ocpus = 4,
      ssh_public_key = "<Enter-sshkey-here>",
      worker_subnet_id = "<Enter-worker-subnet-id-here>",
      pod_subnet_id = "<Enter-pod-subnet-id-here>",
      node_nsg_ids = [],
      pod_nsg_ids = []
    }
  }
}

/* variable "node_nsg_ids" {
  type = list(string)
  default = [ ]
}

variable "pod_nsg_ids" {
  type = list(string)
  default = [ ]
} */

variable "virtual_nodepool" {
  type = map(object({
    node_pool_name = string,
    availabilitydomain = string,
    worker_subnet_id = string,
    faultdomain = list(string),
    size = number,
    pod_subnet_id = string,
    pod_configuration_shape = string,
    node_nsg_ids = list(string),
    pod_nsg_ids = list(string)
  }))
  default = {
    "virtual_nodepool" = {
      node_pool_name = "virtual-nodepool",
      availabilitydomain = "Wfog:EU-ZURICH-1-AD-1",
      faultdomain = [ "FAULT-DOMAIN-1", "FAULT-DOMAIN-2", "FAULT-DOMAIN-3" ],
      size = 2,
      pod_configuration_shape = "Pod.Standard.E3.Flex",
      worker_subnet_id = "<Enter-worker-subnet-id-here>",
      pod_subnet_id = "<Enter-pod-subnet-id-here>",
      node_nsg_ids = [],
      pod_nsg_ids = []
    }
  }
}
