# terraform-eks
This Repo are use to create eks with auto scaling moudle
Here's a breakdown of the code:

data "aws_eks_cluster" "cluster" block uses the aws_eks_cluster data source to retrieve information about an EKS cluster by its name, which is passed in as the name argument, and is obtained from the module.eks.cluster_id variable.

data "aws_eks_cluster_auth" "cluster" block uses the aws_eks_cluster_auth data source to retrieve the Kubernetes Configuration File (kubeconfig) for the EKS cluster by its name, which is passed in as the name argument and is obtained from the module.eks.cluster_id variable.

provider "kubernetes" block sets the provider configuration for interacting with the EKS cluster.

host: The endpoint of the EKS cluster, obtained from data.aws_eks_cluster.cluster.endpoint.
cluster_ca_certificate: The cluster CA certificate for the EKS cluster, obtained by decoding the base64-encoded data in data.aws_eks_cluster.cluster.certificate_authority.0.data
token : The Kubernetes Configuration File (kubeconfig) for the EKS cluster, obtained from data.aws_eks_cluster_auth.cluster.token
module "eks" block creates the EKS cluster, using the terraform-aws-modules/eks/aws module. The various inputs for this module are as follows:
cluster_name: The name of the EKS cluster, passed in from the var.cluster_name variable.
cluster_version: The version of Kubernetes to use for the EKS cluster, passed in from the var.cluster_version variable.
aws_auth_roles: The IAM roles to associate with the EKS cluster, passed in from the var.aws_auth_roles variable.
aws_auth_users: The IAM users to associate with the EKS cluster, passed in from the var.aws_auth_users variable.
subnet_ids: The subnets to use for the EKS cluster, passed in from the var.subnet_id variable.
tags: The tags to apply to the EKS cluster and associated resources, passed in from the var.common_tags variable.
vpc_id: The VPC to use for the EKS cluster, passed in from the var.vpc_id variable.
manage_aws_auth_configmap: A Boolean flag to indicate whether or not to create the aws-auth ConfigMap for the EKS cluster, which is set to true.
enable_irsa: A Boolean flag to indicate whether or not to enable IAM Roles for Service Accounts (IRSA) for the EKS cluster, which is set to true.
eks_managed_node_groups : which is used to create worker node groups for the EKS cluster
worker: The worker node group for the EKS cluster.
name: the name of worker node group passed in from the var.nodegroup_name variable.
Name: the name of worker node group passed in from the var.nodegroup_name variable.
instance_types: the type of instances that the worker node group should use. passed in from the var.instance_type variable.
subnets: the subnet that the worker node group should use. passed in from the var.subnet_id variable.
key_name: the ssh key name for the instances of the worker node group. passed in from the var.key_name variable.
desired_capacity: The desired number of worker nodes for this node group. passed in from the var.desired_capacity variable.
max_capacity: The maximum number of worker nodes for this node group. passed in from the var.max_capacity variable.
min_capacity: The minimum number of worker nodes for this node group. passed in from the var.min_capacity variable.
