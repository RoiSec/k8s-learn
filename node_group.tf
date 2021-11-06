# module "my-node-group" {
#   source = "terraform-aws-modules/eks/aws//modules/node_groups"
#   ng_depends_on = aws_iam_role.eks-node-group-role
#   default_iam_role_arn = aws_iam_role.eks-node-group-role.arn
#   cluster_name = var.cluster_name
  
#   node_groups_defaults = {
#     additional_tags	=var.cluster_tags
#     max_capacity= 5
#     min_capacity=3
#     desired_capacity=3
#     instance_types=["t3.medium"]
#   }
# }