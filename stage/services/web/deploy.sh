terraform remote config  -backend=s3 -backend-config="bucket=terraform-up-and-running-state-vishnu" -backend-config="key=state/stage/services/web/terraform.tfstate" -backend-config="region=us-east-1"  -backend-config="encrypt=true"
terraform remote pull
terraform plan
terraform apply
