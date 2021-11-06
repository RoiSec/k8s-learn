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
  cluster_iam_role_name = aws_iam_role.eks-cluster-role.name
  
  cluster_endpoint_public_access = true // Allow networking from outside
  cluster_endpoint_private_access = true //allow networking from nodes within the VPC
  manage_worker_iam_resources = false // using my node-role 
  manage_cluster_iam_resources = false // using my Cluster Role
  manage_aws_auth = var.manage_aws_auth
  cluster_tags = var.cluster_tags

    
    node_groups_defaults = {
    additional_tags	=var.cluster_tags
    max_capacity= 5
    min_capacity=3
    desired_capacity=3
    instance_types=["t3.large"]
    //iam_instance_profile_name=aws_iam_instance_profile.node_group_instance_profile.name
    # node_role_arn=aws_iam_role.eks-node-group-role.arn
    
  }
  node_groups = {//create  node groups 
    # example = {
      
    # }
}
}
