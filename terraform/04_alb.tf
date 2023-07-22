resource "aws_acm_certificate" "ssc-cert" {
  private_key      = file("../certs/key.pem")
  certificate_body = file("../certs/cert.pem")
}


module "alb" {
  source = "terraform-aws-modules/alb/aws"

  name = "main"

  load_balancer_type = "application"

  vpc_id          = module.vpc.vpc_id
  subnets         = [element(module.vpc.public_subnets, 0), element(module.vpc.public_subnets, 1)]
  security_groups = [module.http-world.security_group_id, module.https-world.security_group_id]


  target_groups = [
    {
      name_prefix      = "pref-"
      backend_protocol = "HTTP"
      backend_port     = 80
      target_type      = "instance"
    }
  ]

  https_listeners = [
    {
      port               = 443
      protocol           = "HTTPS"
      certificate_arn    = aws_acm_certificate.ssc-cert.arn
      target_group_index = 0
    }
  ]

  http_tcp_listeners = [
    {
      port        = 80
      protocol    = "HTTP"
      action_type = "redirect"
      redirect = {
        port        = "443"
        protocol    = "HTTPS"
        status_code = "HTTP_301"
      }
    }
  ]
  tags = merge(local.common_tags)
}



output "alb_dns_name" {
  value = module.alb.lb_dns_name
}
