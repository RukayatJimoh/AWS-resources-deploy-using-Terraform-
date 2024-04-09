variable "db_name" {}
variable "db_password" {}
variable "db_username" {}
variable "db_identifier" {}

variable "engine_version" {
  default = "16.1"
}
variable "db_instance_class" {
  default = "db.t3.micro"
}
variable "allocated_storage" {
 default = "10"
}