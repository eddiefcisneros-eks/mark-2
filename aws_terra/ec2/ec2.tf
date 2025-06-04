resource "aws_instance" "test_server" {
  ami           = "ami-0953476d60561c955"
  instance_type = "t2.micro"
  key_name = "script"
  associate_public_ip_address = true
  subnet_id = element(aws_subnet.public_subnets[*].id,0)
  #count = length(aws_subnet.public_subnets) 
  vpc_security_group_ids = [aws_security_group.test_sg.id]

  tags = {
    Name = "test-server"
  }
  # Copies the install.sh file to /tmp/install.sh

   
  provisioner "remote-exec" {
      inline = [ 
      "mkdir -p /home/ec2-user/tmp",
      "chmod +x /home/ec2-user/tmp/install.sh",
      "sudo /home/ec2-user/tmp/install.sh",
      "sleep 180",
      #"rm -rf /home/ec2-user/tmp/install.sh"
      ]
       connection {
      type        = "ssh"
      user        = "ec2-user" 
      private_key = file("C:/Users/eddie/.ssh/script.pem")
      host        = self.public_ip
      }
    }

  provisioner "file" {
    source      = "install.sh"
    destination = "/home/ec2-user/tmp/install.sh"
  }
  connection {
      type        = "ssh"
      user        = "ec2-user" 
      private_key = file("C:/Users/eddie/.ssh/script.pem")
      host        = self.public_ip
    }

  }

 


/*
resource "null_resource" "execute_script" {
  provisioner "local-exec" {
    interpreter = ["C:/Program Files/Git/bin/bash.exe", "-c"]
    command     = "../../applications/scripts/install.sh"
  }
}
*/