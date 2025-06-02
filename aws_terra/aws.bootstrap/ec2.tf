# creates the bootstrap ec2 instance
resource "aws_instance" "test_env_ec2" {
    ami             = "ami-0e46a6a8d36d6f1f2"
    instance_type   = "t2.micro"
    subnet_id       = data.aws_subnet.subnet[*].id 

    #subnet_id      = data.aws_subnets.destination[*].id


    tags = {
      Name = "test Server"
      Creation_time = time_static.JCRS-e-time.rfc3339
      Creator       = data.external.aws_username.result["name"]

    }
    user_data = <<-EOF
                #!/bin/bash
                sudo apt update
                sudo apt install nginx -y
                systemctl enable nginx
                systemctl start nginx
                EOF
}

