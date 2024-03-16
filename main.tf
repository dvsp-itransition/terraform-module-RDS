resource "aws_db_instance" "this" {  
  identifier           = var.identifier
  engine               = var.engine
  engine_version       = var.engine_version    
  instance_class       = var.instance_class

  allocated_storage     = var.allocated_storage
  max_allocated_storage = var.max_allocated_storage

  db_name  = var.db_name
  username = var.username
  password = var.password
  port     = var.port

  multi_az               = var.multi_az 
  db_subnet_group_name   = var.db_subnet_group_name
  vpc_security_group_ids = var.vpc_security_group_ids
    
  backup_retention_period = var.backup_retention_period
  backup_window                   = var.backup_window  
  skip_final_snapshot     = var.skip_final_snapshot
  deletion_protection     = var.deletion_protection    
   
  replicate_source_db  = module.master.db_instance_identifier  

   tags = {
    Name        = "${var.environment}"
    environment = var.environment
  }
}



