  variable "cluster_version" {
    type = string
    default = "1.21"
  }
  variable "cluster_name" {
    type = string
    default = "Roi-Test-cluster"
  }
    variable "region" {
    type = string
    default = "us-east-2"
  }
  variable "allowing_ips" {
    type = list(string)
  }
  variable "manage_aws_auth" {
      type = bool
      default = true
  }
    variable "enable_irsa" {
      type = bool
      default = true
  }
variable "cluster_tags" {
    type = map(string)
    default = {
  department  = "security"
  division    = "security"
  environment = "dev"
  owner       = "security"
  service     = "eks"
  name        = "Roi-Test-Lab"
}
  
}
