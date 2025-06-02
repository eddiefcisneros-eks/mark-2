#!/bin/bash
export TF_VAR_region="us-gov-west-1"
export TF_VAR_project_name="jcc2-eks-cluster"
export TF_VAR_s3_state_bucket_name="terra-state"
export TF_VAR_s3_versioning_status="Disabled"
export TF_VAR_s3_force_destroy="true"
export TF_VAR_aws_kms_alias="jcc2-kms"
export TF_VAR_db_table_name="terraform_lock"
export initdirectory="/Users/ecisneros/Projects/JCC2/Team5/testcode/infrastructure-us-gov/eks-terraform/bootstrap/infrastructure/aws/bastion"
#export BUCKET_NAME=$(terraform output -raw bucket_state_name)


#AWS profile can be remove after setting up CI/CD pipeline
echo -n "apply or destroy enviroment: " 
read varoption 

AWS_PROFILE=jcc2 terraform -chdir="${initdirectory}" init 
AWS_PROFILE=jcc2 terraform -chdir="${initdirectory}" plan
AWS_PROFILE=jcc2 terraform -chdir="${initdirectory}" $varoption -auto-approve



#./backend.sh

