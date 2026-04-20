resource "aws_ecs_service" "ecs-service" {
  name             = "my-service"
  launch_type      = "FARGATE"
  platform_version = "LATEST"
  cluster          = aws_ecs_cluster.main.id
  task_definition  = aws_ecs_task_definition.TD.arn
  desired_count    = 1
  depends_on       = [aws_alb_listener.listener, aws_iam_role.iam-role]

  load_balancer {
    target_group_arn = aws_lb_target_group.TG.arn
    container_name   = "mynode"
    container_port   = 80
  }

  network_configuration {
    subnets          = [aws_subnet.public_subnet_1.id, aws_subnet.public_subnet_2.id]
    assign_public_ip = true
    security_groups  = [aws_security_group.ecs_sg.id]
  }
}
