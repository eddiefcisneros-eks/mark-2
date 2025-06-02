#!/bin/bash

function set_tfvars() {
  export TF_VAR_aws_account_number=$aws_account_number
  export TF_VAR_aws_region_classification=$aws_region_classification
  export TF_VAR_aws_region=$aws_region
  export TF_VAR_subnet_id=$subnet_id
  export TF_VAR_subnets=$jcrse_aws_subnet_ids
  export TF_VAR_env_tier=$env_tier
  export TF_VAR_aws_env_name=$env_name
  export TF_VAR_cluster_name=$cluster_name
  export TF_VAR_cluster_type=$cluster_type
  export TF_VAR_ami_id_rke2=$ami_id_rke2
  export TF_VAR_ami_id_eks=$ami_id_eks
  export TF_VAR_aws_access_key_id=${AWS_ACCESS_KEY_ID}
  export TF_VAR_aws_secret_access_key=${AWS_SECRET_ACCESS_KEY}
  export TF_VAR_aws_kms_arn=$aws_kms_arn
  export TF_VAR_auto_destroy=$auto_destroy
  export TF_VAR_aws_s3_output_bucket_key=$cluster_output_bucket_key
}

function terraform_init() {
  banner " Initializing Terraform for cluster "
  echo "State = ${cluster_state_bucket_key} -- Type = ${cluster_type} -- Dir = /kraken"
  source /kraken/scripts/helpers.sh
  create_vars_files
  cat "${kraken_home_path}/infra/cluster/platform/aws/${cluster_type}/backend.tf"
  cat "${kraken_home_path}/infra/cluster/platform/aws/${cluster_type}/terraform.tfvars"
  terraform -chdir="${kraken_home_path}/infra/cluster/platform/aws/${cluster_type}" \
    init -input=false
}

function overlay_variables() {
  NEW_PLAN="terraform -chdir='${kraken_home_path}/infra/cluster/platform/aws/${cluster_type}' plan \
    -out '${kraken_home_path}/infra/cluster/platform/aws/${cluster_type}/the.tfplan' \
    -var-file='${kraken_home_path}/infra/cluster/platform/aws/${cluster_type}/terraform.tfvars'"
}

function terraform_plan() {
  eval $NEW_PLAN
}

function terraform_apply() {
  terraform -chdir="${kraken_home_path}/infra/cluster/platform/aws/${cluster_type}" \
    apply "${kraken_home_path}/infra/cluster/platform/aws/${cluster_type}/the.tfplan"
}

function terraform_destroy() {
  cat "${kraken_home_path}/infra/cluster/platform/aws/${cluster_type}/backend.tf"
  cat "${kraken_home_path}/infra/cluster/platform/aws/${cluster_type}/terraform.tfvars"
  terraform -chdir="${kraken_home_path}/infra/cluster/platform/aws/${cluster_type}" \
    destroy -auto-approve -var-file="/kraken/infra/cluster/platform/aws/${cluster_type}/terraform.tfvars"
}
