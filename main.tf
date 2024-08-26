terraform { 
  cloud { 
    
    organization = "02-spring-cloud2024" 

    workspaces { 
      name = "new_workspace" 
    } 
  } 
}

provider "aws" {
  region = "us-east-1"
}




module "network" {
  source = "./modules"
  


  sg_rules = [
    {
      type        = "ingress"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      description = "SSH"
    },
    {
      type        = "egress"
      from_port   = 0
      to_port     = 0
      
      cidr_blocks = ["0.0.0.0/0"]
      description = "All traffic"
    }
  ]
}