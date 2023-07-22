module "http-world" {
  source              = "terraform-aws-modules/security-group/aws//modules/http-80"
  name                = "80 from world"
  description         = "Security group for web-server with http port open within VPC"
  vpc_id              = module.vpc.vpc_id
  ingress_cidr_blocks = ["0.0.0.0/0"]
  tags                = merge(local.common_tags)
}

module "https-world" {
  source              = "terraform-aws-modules/security-group/aws//modules/https-443"
  name                = "443 from world"
  description         = "Security group for web-server with http port open within VPC"
  vpc_id              = module.vpc.vpc_id
  ingress_cidr_blocks = ["0.0.0.0/0"]
  tags                = merge(local.common_tags)
}
