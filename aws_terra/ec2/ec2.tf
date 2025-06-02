resource "aws_instance" "test_server" {
  ami           = "ami-0953476d60561c955"
  instance_type = "t2.micro"
  key_name = "test"
  associate_public_ip_address = true
  subnet_id = element(aws_subnet.public_subnets[*].id,0)
  #count = length(aws_subnet.public_subnets) 
  vpc_security_group_ids = [aws_security_group.test_sg.id]

  tags = {
    Name = "test-server"
  }
}
resource "null_resource" "execute_script" {
  provisioner "local-exec" {
    command = "cd ../../applications/scripts/install.sh"  # Path to your shell script
  }

  triggers = {
    always_run = timestamp()  # Trigger execution on each apply (optional)
  }
}