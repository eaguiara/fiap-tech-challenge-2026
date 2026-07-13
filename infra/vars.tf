variable "aws_region" {
  type        = string
  default     = "us-east-2"
  description = "Região da AWS"
}

variable "sql_db_name" {
  default = "garage-flow"
  description = "Nome do banco de dados SQL Server"
}

variable "sql_db_user" {
  default = "garage_flow"
  description = "Usuário padrão do banco"
}

variable "sql_db_password" {
  type = string
  description = "Senha padrão do banco"
}