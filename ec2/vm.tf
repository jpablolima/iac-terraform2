resource "aws_key_pair" "key" {
  key_name   = "aws-key"
  public_key = file("./aws-key.pub")
}

resource "aws_instance" "vm" {
  ami                    = "ami-007855ac798b5175e"
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.key.key_name
  subnet_id              = data.terraform_remote_state.vpc.outputs.subnet_id
  vpc_security_group_ids = [data.terraform_remote_state.vpc.outputs.security_group_id]


  tags = {
    "Name" : "vm-terraform"
  }

}
