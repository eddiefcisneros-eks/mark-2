
export_env() {
export TF_VAR_env_tier="$env_tier"
export TF_VAR_region="$region"
export TF_VAR_zone1="$zone1"
export TF_VAR_zone2="$zone2"
export TF_VAR_project="$project"
export TF_VAR_eks_name="$eks_name"
export TF_VAR_eks_version="$eks_version"
export TF_VAR_eks_node_name="$eks_node_name"
export TF_VAR_project="$project"
}

echo "$env_tier"
echo "$region"
echo "$zone1"
echo "$zone2"
echo "$project"
echo "$eks_name"
echo "$eks_version"
echo "$eks_node_name"
echo "$TF_VAR_project"
