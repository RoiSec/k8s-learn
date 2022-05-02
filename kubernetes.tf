provider "kubernetes" {
  host                   = data.aws_eks_cluster.eks.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.eks.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.eks.token
}
resource "kubernetes_service_account" "iam-test" {
  metadata {
    name = "iam-test"
    namespace = "default"
    annotations = {
      "eks.amazonaws.com/role-arn" = module.k8s-service-a.iam_role_arn
    }
    
  }
  depends_on = [
    module.roi-eks
  ]
}
