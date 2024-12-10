# step 1: secret for DB credentials
resource "aws_secretsmanager_secret" "db_secret" {
  name = "my-db-secret"
}

# step 2: create username and password
resource "aws_secretsmanager_secret_version" "db_credentials_version" {
  secret_id     = aws_secretsmanager_secret.db_secret.id
  secret_string = jsonencode({
    username = "ally"
    password = "ally123"
  })
}

# step 3: custom DB parameter group
resource "aws_rds_parameter_group" "custom_db_param_group" {
  name        = "my-custom-db-parameter-group"
  family      = "postgres15" 
}

# step 4: create a custom Option Group
resource "aws_rds_option_group" "custom_option_group" {
  name        = "my-custom-option-group"
  engine_name = "postgres"
  major_engine_version = "13"
}