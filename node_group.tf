module "my-node-group" {
  source = "terraform-aws-modules/eks/aws//modules/node_groups"
  ng_depends_on = aws_iam_role.eks-node-group-role
  default_iam_role_arn = aws_iam_role.eks-node-group-role.arn
  
}