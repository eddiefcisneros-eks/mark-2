#!/bin/bash
export initdirectory="/Users/ecisneros/Projects/JCC2/Team5/testcode/infrastructure-us-gov/eks-terraform/bootstrap/infrastructure/aws/bastion"
export BUCKET_NAME=$(terraform -chdir="${initdirectory}" output -raw bucket_state_name)
export BUCKET_REGION=$(terraform -chdir="${initdirectory}" output -raw region)
export KEY="terrastate.tfstate"
terraform -chdir="${initdirectory}" init -reconfigure

cat <<-EOF >> $initdirectory/7-backend.tf
terraform {
  backend "s3" {
    bucket  = "${BUCKET_NAME}"
    key     = "${KEY}"
    region  = "${BUCKET_REGION}"
  }
}
EOF

echo "Initializing Terraform with remote backend..."

if test -f "initdirectory/terraform.state" ;
then

# if file exist the it will be printed 
echo "File is exist"
else

# is it is not exist then it will be printed
echo "File is not exist"
fi