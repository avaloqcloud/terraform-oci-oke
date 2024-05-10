# Terraform Oracle Kubernetes Engine (OKE) cluster module

Terraform module to provision Oracle Cloud Infrastructure (OCI) Kubernetes (OKE) cluster with dynamic nodepool creation.

## Table of contents

* [Requirements](#requirements)
* [Mdodules](#modules)
* [Usage](#usage)
* [Inputs](#inputs)


## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | ~> 2.23 |
| <a name="requirement_oci"></a> [oci](#requirement\_oci) | ~> 5.16 |


## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_k8s-cluster"></a> [k8s-cluster](#module\_k8s-cluster) | ./modules/k8s-cluster | n/a |
| <a name="module_nodepool"></a> [nodepool](#module\_nodepool) | ./modules/nodepool | n/a |
| <a name="module_virtual-nodepool"></a> [virtual-nodepool](#module\_virtual-nodepool) | ./modules/virtual-nodepool | n/a |



## Usage
 
    module "terraform-oci-oke" {
        source = "github.com/avaloqcloud/terraform-oci-oke"
    }

### File `provider.tf` content example:

```hcl
terraform {
  
  required_version = ">= 1.2.0"

  required_providers {
    oci = {
      source = "oracle/oci"
      version = "~> 5.16"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.23"
    }
  }
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_kubernetes_version"></a> [cluster\_kubernetes\_version](#input\_cluster\_kubernetes\_version) | n/a | `string` | `"v1.27.2"` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | The name of oke cluster. | `string` | `"oke"` | no |
| <a name="input_cluster_type"></a> [cluster\_type](#input\_cluster\_type) | The cluster type. See <a href=https://docs.oracle.com/en-us/iaas/Content/ContEng/Tasks/contengworkingwithenhancedclusters.htm>Working with Enhanced Clusters and Basic Clusters</a> for more information. | `string` | `"basic"` | no |
| <a name="input_cni_type"></a> [cni\_type](#input\_cni\_type) | The CNI for the cluster: FLANNEL\_OVERLAY or OCI\_VCN\_IP\_NATIVE | `string` | `"OCI_VCN_IP_NATIVE"` | no |
| <a name="input_compartment_id"></a> [compartment\_id](#input\_compartment\_id) | n/a | `string` | n/a | yes |
| <a name="input_control_plane_subnet_id"></a> [control\_plane\_subnet\_id](#input\_control\_plane\_subnet\_id) | The id of the regional subnet in which to place the Cluster endpoint. | `string` | n/a | yes |
| <a name="input_is_public_ip_enabled"></a> [is\_public\_ip\_enabled](#input\_is\_public\_ip\_enabled) | Whether the Kubernetes control plane endpoint should be allocated a public IP address to enable access over public internet. | `bool` | `false` | no |
| <a name="input_loadbalancer_subnet_id"></a> [loadbalancer\_subnet\_id](#input\_loadbalancer\_subnet\_id) | The ids of the subnets used for Kubernetes services load balancers. | `string` | n/a | yes |
| <a name="input_node_type"></a> [node\_type](#input\_node\_type) | The type of the node pool: Managed or Virtual | `string` | `"Managed"` | no |
| <a name="input_nodepool"></a> [nodepool](#input\_nodepool) | n/a | <pre>map(object({<br>    node_pool_name = string,<br>    image_id = string,<br>    node_shape = string,<br>    availabilitydomain = string,<br>    worker_subnet_id = string,<br>    faultdomain = list(string),<br>    size = number,<br>    max_pods_per_node = number,<br>    pod_subnet_id = string,<br>    memory = number,<br>    ocpus = number,<br>    ssh_public_key = string,<br>    pod_configuration_shape = string <br>  }))</pre> | <pre>{<br>  "nodepool": {<br>    "availabilitydomain": "Wfog:EU-ZURICH-1-AD-1",<br>    "faultdomain": [<br>      "FAULT-DOMAIN-1",<br>      "FAULT-DOMAIN-2",<br>      "FAULT-DOMAIN-3"<br>    ],<br>    "image_id": "id1.image.oc1.eu-zurich-1.aaaaaaaa4gholoh5cndh6fxhm4nsbnrfyrtpy6wbnkablzhg2xjfw2iutq7q",<br>    "max_pods_per_node": 67,<br>    "memory": 32,<br>    "node_pool_name": "managed-nodepool",<br>    "node_shape": "VM.Standard.E3.Flex",<br>    "ocpus": 4,<br>    "pod_configuration_shape": "Pod.Standard.E3.Flex",<br>    "pod_subnet_id": "<Enter-pod-subnet-id-here>",<br>    "size": 2,<br>    "ssh_public_key": "<Enter-sshkey-here>",<br>    "worker_subnet_id": "<Enter-worker-subnet-id-here>"<br>  }<br>}</pre> | no |
| <a name="input_pods_cidr"></a> [pods\_cidr](#input\_pods\_cidr) | The CIDR range used for IP addresses by the pods. A /16 CIDR is generally sufficient. This CIDR should not overlap with any subnet range in the VCN (it can also be outside the VCN CIDR range). Ignored when cni\_type = 'npn'. | `string` | `"10.244.0.0/16"` | no |
| <a name="input_services_cidr"></a> [services\_cidr](#input\_services\_cidr) | The CIDR range used within the cluster by Kubernetes services (ClusterIPs). This CIDR should not overlap with the VCN CIDR range. | `string` | `"10.96.0.0/16"` | no |
| <a name="input_vcn_id"></a> [vcn\_id](#input\_vcn\_id) | The id of the virtual cloud network (VCN) in which to create the cluster. | `string` | n/a | yes |
| <a name="input_virtual-nodepool"></a> [virtual-nodepool](#input\_virtual-nodepool) | n/a | <pre>map(object({<br>    node_pool_name = string,<br>    availabilitydomain = string,<br>    worker_subnet_id = string,<br>    faultdomain = list(string),<br>    size = number,<br>    pod_subnet_id = string,<br>    pod_configuration_shape = string <br>  }))</pre> | <pre>{<br>  "virtual-nodepool": {<br>    "availabilitydomain": "Wfog:EU-ZURICH-1-AD-1",<br>    "faultdomain": [<br>      "FAULT-DOMAIN-1",<br>      "FAULT-DOMAIN-2",<br>      "FAULT-DOMAIN-3"<br>    ],<br>    "node_pool_name": "virtual-nodepool",<br>    "pod_configuration_shape": "Pod.Standard.E3.Flex",<br>    "pod_subnet_id": "<Enter-pod-subnet-id-here>",<br>    "size": 2,<br>    "worker_subnet_id": "<Enter-worker-subnet-id-here>"<br>  }<br>}</pre> | no |
