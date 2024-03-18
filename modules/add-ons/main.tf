resource "oci_containerengine_addon" "test_addon" {
    #Required
    count = var.cluster_type == "enhanced" && var.addon_name != "none" ? 1 : 0
    addon_name = var.addon_name
    cluster_id = var.cluster_id
    remove_addon_resources_on_delete = true 
}