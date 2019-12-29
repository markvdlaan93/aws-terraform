# aws-terraform
Dedicated repository for my own Terraform AWS setup.

## Run Terraform scripts for configuring IAM/backend

The IAM subdirectory contains all Terraform files which are used to create users. The terraform-state subdirectory is used for creating S3 buckets for storing Terraform state files.  

Terraform needs an access key and secret with the right permissions to create users and buckets. In the AWS console create a group with `IAMFullAccess` and `S3FullAccess` policies enabled. After creating the group, it is important to add a user to this group. 

Create an environment variables file:
```
export TF_VAR_aws_ec2_access_key_iam_user="<Account ID for creating IAM related stuff (iam subdirectory)>"
export TF_VAR_aws_ec2_secret_key_iam_user="<Account secret>"
export TF_VAR_aws_region="<AWS region like for example us-west-1>"
export TF_VAR_aws_account_id="<Your account number>"
```

After that, run `source path/to/your/envfile/envfile`. You should now have enough permissions to create new users and buckets with Terraform. Therefore, run `terraform init`, `terraform plan` and `terraform apply` from the `terraform-state`-subdirectory and after that from the `iam`-subdirectory.

## Run Terraform scripts in root directory

The Terraform scripts in the root directory contain all application code. In order to run these scripts you need to add two extra variables to the env file from the previous section:
```
export TF_VAR_aws_ec2_access_key_iam_user="<Account ID for creating IAM related stuff (iam subdirectory)>"
export TF_VAR_aws_ec2_secret_key_iam_user="<Account secret>"
export TF_VAR_aws_ec2_access_key_end_user="<Account ID from terraform apply output from iam subdirectory>"
export TF_VAR_aws_ec2_secret_key_end_user="<Account ID from terraform apply output from iam subdirectory>"
export TF_VAR_aws_region="<AWS region like for example us-west-1>"
export TF_VAR_aws_account_id="<Your account number>"
```

After that, you can run `terraform init`, `terraform plan` and `terraform apply` to use my setup.

## Terraform version compatibility

All Terraform code in this repository is tested against Terraform version `0.11.14`.