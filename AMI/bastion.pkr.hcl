variable "region" {
  type    = string
  default = "us-east-1"
}

variable "ami_id" {
    type = string
    default = "ami-06640050dc3f556bb" 
}
locals {
  timestamp = regex_replace(timestamp(), "[- TZ:]", "")
  app_name = "terraform-bastion-prj-19"
}



# source blocks are generated from your builders; a source can be referenced in
# build blocks. A build block runs provisioners and post-processors on a
# source.
source "amazon-ebs" "terraform-bastion-prj-19" {
  ami_name      = "terraform-bastion-prj-19-${local.timestamp}"
  instance_type = "t2.micro"
  region        = var.region
  source_ami    = "${var.ami_id}"  
  ssh_username = "ec2-user"
  tag {
    key   = "Name"
    value = "terraform-bastion-prj-19"
  }
}


# a build block invokes sources and runs provisioning steps on them.
build {
  sources = ["source.amazon-ebs.terraform-bastion-prj-19"]

  provisioner "shell" {
    script = "bastion.sh"
  }
}