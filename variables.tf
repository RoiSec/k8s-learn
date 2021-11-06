  variable "cluster_version" {
    type = string
    default = "1.21"
  }
  variable "cluster_name" {
    type = string
    default = "Roi-Test-cluster"
  }
  variable "allowing_ips" {
    type = list(string)
    default = ["89.139.169.7/32"]
  }
  variable "manage_aws_auth" {
      type = bool
      default = false
    
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
variable "name" {
    type = string
    default = "Roi-Test"
    description = "(optional) describe your variable"
}