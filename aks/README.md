# Terraform AKS Module

This module handles the creation of an AKS cluster and autoscale gorupS for nodes in AZURE 

The resources/services/activations/deletions that this module will create/trigger are:
- Create AKS Cluster
- Create Nodes


## Compatibility

This module is meant for use with Terraform 0.12. If you haven't
[upgraded][terraform-0.12-upgrade] and need a Terraform
0.11.x-compatible version of this module, the last released version
intended for Terraform 0.11.x is [3.0.0].

## Usage

```hcl
module "aks" {
        source              = "git::https://oauth2:<oauthtoken>@gitlab.com/kwdevops/azure-terraform-modules//aks"
        resource_group_name = "demo"
        location            = "eastus"
        cluster_name        = "testaksclus"
        node_name           = "testaksnode"
        node_count          = 1
        node_size           = "Standard_DS1_v2"
        node_type           = "VirtualMachineScaleSets"
        min_node_count      = 1
        max_node_count      = 3
        max_pods            = 31
        sp_client_id        = "24f16c2d-61bb-4d29-b5df-de13bc33f4e8"
        sp_client_secret    = "2145caf7-afe3-4e82-a1f1-7f60a80c440b"
        autoscale           = "true"
        tags                = "test"
}
```