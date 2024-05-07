module "k8s-cluster" {
  source                           = "./modules/k8s-cluster"
  compartment_id                   = var.compartment_id          
  cluster_kubernetes_version       = var.cluster_kubernetes_version  
  cluster_name                     = var.cluster_name                 
  vcn_id                           = var.vcn_id                        
  cni_type                         = var.cni_type                         
  is_public_ip_enabled             = var.is_public_ip_enabled           
  control_plane_subnet_id          = var.control_plane_subnet_id       
  loadbalancer_subnet_id           = var.loadbalancer_subnet_id         
  pods_cidr                        = var.pods_cidr                         
  services_cidr                    = var.services_cidr                   
  cluster_type = lookup({
    "basic"    = "BASIC_CLUSTER",
    "enhanced" = "ENHANCED_CLUSTER"
  }, lower(var.cluster_type), "BASIC_CLUSTER")

  defined_tags  = var.defined_tags
  freeform_tags = var.freeform_tags

}

module "add-ons" {
  source = "./modules/add-ons"
  for_each = toset(var.addon_name)
  addon_name = each.value
  cluster_id = module.k8s-cluster.cluster_id
  cluster_type = var.cluster_type

  depends_on = [ module.k8s-cluster ]
}

module "nodepool" {  
  source                                  = "./modules/nodepool"  
  for_each                                = var.node_type == "Managed" ? var.nodepool : {}
  node_pool_name                          = each.value.node_pool_name 
  cluster_id                              = module.k8s-cluster.cluster_id    
  compartment_id                          = var.compartment_id                     
  cluster_kubernetes_version              = var.cluster_kubernetes_version                            
  cni_type                                = var.cni_type                                
  image_id                                = each.value.image_id              
  node_shape                              = each.value.node_shape                 
  availabilitydomain                      = each.value.availabilitydomain         
  worker_subnet_id                        = each.value.worker_subnet_id          
  faultdomain                             = each.value.faultdomain                 
  size                                    = each.value.size                        
  max_pods_per_node                       = each.value.max_pods_per_node           
  pod_subnet_id                           = each.value.pod_subnet_id            
  memory                                  = each.value.memory                     
  ocpus                                   = each.value.ocpus                      
  ssh_public_key                          = each.value.ssh_public_key             
  node_type                               = var.node_type
  pod_configuration_shape                 = each.value.pod_configuration_shape    
  defined_tags                            = var.defined_tags
  freeform_tags                           = var.freeform_tags

}

module "virtual_nodepool" {
  source                                  = "./modules/virtual_nodepool"
  for_each                                = var.node_type == "Virtual" ? var.virtual_nodepool : {}
  cluster_id                              = module.k8s-cluster.cluster_id  
  compartment_id                          = var.compartment_id                         
  node_pool_name                          = each.value.node_pool_name 
  availabilitydomain                      = each.value.availabilitydomain    
  faultdomain                             = each.value.faultdomain           
  worker_subnet_id                        = each.value.worker_subnet_id   
  pod_configuration_shape                 = each.value.pod_configuration_shape
  pod_subnet_id                           = each.value.pod_subnet_id        
  size                                    = each.value.size  
  defined_tags                            = var.defined_tags
  freeform_tags                           = var.freeform_tags
              
}
