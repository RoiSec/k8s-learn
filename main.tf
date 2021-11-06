provider "aws" {
  region = "eu-west-2"
}
module "roi-eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_version = var.cluster_version
  cluster_name    = var.cluster_name
  vpc_id          = module.roi-vpc.vpc_id
  subnets         = module.roi-vpc.private_subnets
  cluster_endpoint_public_access_cidrs = var.allowing_ips
  cluster_iam_role_name = aws_iam_role.eks-cluster-role
  manage_aws_auth = var.manage_aws_auth
  cluster_tags = var.cluster_tags
  # node_groups = {
  #   roi-node-group = {
  #     desired_capacity = 3
  #     max_capacity     = 10
  #     min_capacity     = 3
  #     additional_tags = {
  #       name = "Roi-test"
  #     }
      
  #   }
  # }

}