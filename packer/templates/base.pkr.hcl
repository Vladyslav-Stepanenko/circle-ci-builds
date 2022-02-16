locals {
  timestamp = regex_replace(timestamp(), "[- :TZ]", "")
}

data "amazon-ami" "ubuntu-focal" {
  filters = {
    name                = "ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"
    root-device-type    = "ebs"
    virtualization-type = "hvm"
  }
  region      = "us-west-2"
  most_recent = true
  owners      = ["099720109477"]
}

source "amazon-ebs" "base" {
  ami_name      = "ubuntu-with-nginx-${local.timestamp}"
  region        = "us-west-2"
  instance_type = "t2.micro"
  source_ami    = data.amazon-ami.ubuntu-focal.id
  ssh_username  = "ubuntu"
  tags          = { Provider = "Packer" }
}

build {
  sources = ["source.amazon-ebs.base"]
  provisioner "shell" {
    script = "scripts/install_nginx.sh"
  }
}