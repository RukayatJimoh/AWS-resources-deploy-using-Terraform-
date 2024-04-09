# resource "aws_redshift_cluster" "example" {
#   cluster_identifier = "tf-redshift-cluster"
#   database_name      = "mydb"
#   master_username    = "exampleuser"
#   master_password    = "Mustbe8characters"
#   node_type          = "dc1.large"
#   cluster_type       = "single-node"
#   iam_roles          = ""
# }

resource "aws_redshift_cluster" "example" {
  cluster_identifier = var.redshift-cluster-identifier
  database_name      = var.redshift_database_name
  master_username    = var.redshift-username
  master_password    = var.redshift-password
  node_type          = var.node-type
  cluster_type       = var.cluster-type
  iam_roles          = var.redshift-iam-roles
}