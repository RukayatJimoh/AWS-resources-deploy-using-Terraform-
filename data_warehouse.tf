resource "random_password" "bimmy-company-redshift" {
  length           = 20
  special          = false
}

resource "aws_ssm_parameter" "bimmy-pw-redshift-source" {
  name  = "bimmy_datawarehouse_password"
  type  = "String"
  value = random_password.bimmy-company-redshift.result
}

resource "aws_iam_role" "redshift_role" {
  name = "redshift_assumed_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "redshift.amazonaws.com"
        }
      },
    ]
  })
  }


resource "aws_iam_policy" "redshift-policy" {
  name        = "test_policy"
  description = "A dedicated policy for Redshift cluster"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3:List*",
          "s3:Get*"
        ]
        Effect   = "Allow"
        Resource =[
         "arn:aws:s3:::faker-raw-data",
        "arn:aws:s3:::faker-raw-data/spec*",
        ]
      },
      {
        Action = [
            "glue:*"
        ]
        Effect = "Allow"
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "test-attach" {
  role       = aws_iam_role.redshift_role.name
  policy_arn = aws_iam_policy.redshift-policy.arn
}

module "bimmy-warehouse" {
  source = "./module/redshift"
  redshift-cluster-identifier = "bimmybrown-warehouse"
  redshift_database_name = "bimmybrown_staff"
  redshift-username = "staff"
  redshift-password = aws_ssm_parameter.bimmy-pw-redshift-source.value
  redshift-iam-roles = [aws_iam_role.redshift_role.arn] 
  }
  