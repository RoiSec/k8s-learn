provider "aws" {
  region = "eu-west-2"
}
data "aws_eks_cluster" "eks" {
  name = module.roi-eks.cluster_id
}

data "aws_eks_cluster_auth" "eks" {
  name = module.roi-eks.cluster_id
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.eks.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.eks.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.eks.token
}
module "roi-eks" {
  source          = "terraform-aws-modules/eks/aws"
  
  cluster_version = "1.21"
  cluster_name    = "Roi-Test-cluster"
  vpc_id          = module.roi-vpc.vpc_id
  subnets         = module.roi-vpc.private_subnets
  cluster_security_group_id = aws_security_group.VPN.id
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