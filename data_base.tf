resource "random_password" "bimmy_company" {
  length           = 20
  special          = false
}

resource "aws_ssm_parameter" "bimmy_password_source" {
  name  = "bimmy_database_password"
  type  = "String"
  value = random_password.bimmy_company.result
}

module "bimmy_module_db" {
    source = "./module/rds"
    db_identifier = "bimmy-department"
    db_name = "bimmybrown"
    db_username = "bimmy"
    db_password =aws_ssm_parameter.bimmy_password_source.value
    }
