resource "aws_launch_template" "AmazonLinux" {
  name_prefix   = "amazon-linux-lt-"
  image_id      = "ami-0c3d1e0f8ec487d6d" # Amazon Linux 2023 AMI 2023.10.20260325.0 x86_64 HVM kernel-6.18
  instance_type = "t3.micro"

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [var.sg_id]
  }

  tag_specifications {
    resource_type = "instance"
    tags = { Name = "AmazonLinux-Worker" }
  }
}

resource "aws_autoscaling_group" "asg" {
  desired_capacity    = 2
  max_size            = 3
  min_size            = 2
  vpc_zone_identifier = [var.subnet_id]

  launch_template {
    id      = aws_launch_template.AmazonLinux.id
    version = "$Latest"
  }
}