# terraform-eks
## This Repo are use to create eks with auto scaling.
### Here's a breakdown of the code:

***Retrieves information about an existing EKS cluster using the aws_eks_cluster data source.***

Retrieves the Kubernetes Configuration File (kubeconfig) for the EKS cluster using the aws_eks_cluster_auth data source.

**Configures the kubernetes provider to interact with the EKS cluster using the endpoint, certificate authority, and kubeconfig obtained in step 1 and 2.
Uses the terraform-aws-modules/eks/aws module to create an EKS cluster with the provided parameters such as name, version, subnets and Kubernetes nodes group.

***creates worker node group for the EKS cluster and configure them with the provided parameters.
creates the aws-auth ConfigMap for the EKS cluster.

enables IAM Roles for Service Accounts (IRSA) for the EKS cluster

This Terraform code creates the EKS cluster in AWS, and sets up the necessary provider and modules to interact with the EKS cluster using the Kubernetes provider.



