resource "aws_lb_target_group" "TG" {
  name        = "TG"
  port        = "80"
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = "TG"
  }
}
