#!/bin/bash

# Set Environment Variables from the input.yaml
source ./set_env_variables.sh
set_env_variables

# Export to TF_VAR
source ./export.sh
export_env

#s3 Terraform Script 


# Run Terraform commands
terraform init
terraform plan
terraform apply
