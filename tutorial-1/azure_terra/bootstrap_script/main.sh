#!/bin/bash
export TF_VAR_resource_group_location="East US"
export TF_VAR_resource_group_name_prefix="project"
export TF_VAR_vnet_name="core_vnet"
export TF_VAR_VNET_IP="10.0.0.0/16"
export TF_VAR_subnet_private_name="subnet_private"
export TF_VAR_subnet_private_IP="10.0.1.0/24,10.0.2.0/24"
export TF_VAR_subnet_public_name="subnet_public"
export TF_VAR_subnet_public_IP="10.0.3.0/24,10.0.4.0/24"
export initdirectory="/Users/ecisneros/azure/azure_terra/core_modules/vnet"
terraform -chdir="${initdirectory}" init
terraform -chdir="${initdirectory}" plan
terraform -chdir="${initdirectory}" apply
