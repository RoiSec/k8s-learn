module "my-node-group" {
  source = "terraform-aws-modules/eks/aws//modules/node_groups"
  depends_on = [
    aws_iam_role.eks-node-group-role
  ]
  cluster_name = module.roi-eks.cluster_id
  cluster_endpoint = module.roi-eks.cluster_endpoint
}