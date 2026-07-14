resource "aws_security_group" "sql_server_sg" {
    name = "garage-flow-sg"
    description = "Public security group"

    ingress {
        from_port = 1433
        to_port = 1433
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0 
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_db_instance" "sql_server" {
  engine         = "sqlserver-ex"
  instance_class = "db.t3.micro"
  username       = var.sql_db_user
  password    = var.sql_db_password
  allocated_storage = 20
  identifier = var.sql_db_name
  publicly_accessible = true
  skip_final_snapshot = true
  vpc_security_group_ids = [aws_security_group.sql_server_sg.id]
}