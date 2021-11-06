provider "aws" {
  region = "eu-west-2"
}
module "roi-eks" {
  source          = "terraform-aws-modules/eks/aws"
  
  cluster_version = "1.21"
  cluster_name    = "Roi-Test-cluster"
  vpc_id          = module.roi-vpc.vpc_id
  subnets         = module.roi-vpc.private_subnets
  cluster_endpoint_public_access_cidrs =["89.139.169.7/32"]  
  manage_aws_auth = false
  cluster_tags = {name="Roi"}
  node_groups = {
    roi-node-group = {
      desired_capacity = 3
      max_capacity     = 10
      min_capacity     = 3
      additional_tags = {
        name = "Roi-test"
      }
      
    }
  }

}