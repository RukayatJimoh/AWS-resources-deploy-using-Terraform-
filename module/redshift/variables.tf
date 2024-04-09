variable "redshift-cluster-identifier" {}
variable "redshift_database_name" {}
variable "redshift-username" {}
variable "redshift-password" {}
variable "redshift-iam-roles" {}
variable "node-type" {
  default = "dc2.large"
}
variable "cluster-type" { 
  default = "single-node"
}
