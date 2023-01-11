common_tags = {
  "Project-name" = "devops"
  "env_type"     = "stage"


}



account_id      = "9272-9787-1434"
cluster_version = "1.22"
component       = "stging-eks"
worker_name     = "nginx-stging"




env_name     = "stage"
project_name = "sample"


aws_region = "ap-south-1"
#region
vpc_id = "vpc-0d656cd98a608c893"
#default vpc id
key_name     = "terrafrom"
application  = "nginx-app"
cluster_name = "nginx-stg"

role = "eks-cluster"

subnet_id = ["subnet-0e93e079c603ddd12", "subnet-0a08aa9a6cd26c613", "subnet-0213a544bbe4b4dac"]



#nodegrp details

nodegroup_name = "stging-nginx-"

#instnace type

instance_type = "t2.micro"




#node capacity

desired_capacity = 2
min_capacity     = 2
max_capacity     = 5








