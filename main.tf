data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.cluster.token
}

module "eks" {
  source                    = "terraform-aws-modules/eks/aws"
  version                   = "19.5.1"
  cluster_name              = var.cluster_name
  cluster_version           = var.cluster_version
  aws_auth_roles            = var.aws_auth_roles
  aws_auth_users            = var.aws_auth_users
  subnet_ids                = var.subnet_id
  tags                      = var.common_tags
  vpc_id                    = var.vpc_id
  manage_aws_auth_configmap = true
  enable_irsa               = true
  #workers_additional_policies = [aws_iam_policy.eks_worker_policy.arn]

  eks_managed_node_groups = {
    worker = {
      name           = var.nodegroup_name
      Name           = var.nodegroup_name
      instance_types = [var.instance_type]
      subnets        = var.subnet_id
      key_name       = var.key_name

      desired_capacity = var.desired_capacity
      max_capacity     = var.max_capacity
      min_capacity     = var.min_capacity
    }
  }

}
