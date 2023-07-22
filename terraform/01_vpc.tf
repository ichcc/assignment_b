module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name                                          = "bizzabo"
  cidr                                          = "10.0.0.0/16"
  enable_ipv6                                   = true
  public_subnet_assign_ipv6_address_on_creation = true

  azs             = ["${local.region}a", "${local.region}b"]
  private_subnets = ["10.0.101.0/24", "10.0.102.0/24"]
  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]

  public_subnet_ipv6_prefixes  = [0, 1]
  private_subnet_ipv6_native   = true
  private_subnet_ipv6_prefixes = [2, 3]


  enable_nat_gateway     = true
  single_nat_gateway     = true
  one_nat_gateway_per_az = false

  enable_dhcp_options      = true
  dhcp_options_domain_name = "assignment.bizzabo.internal"

  enable_dns_hostnames = true
  enable_dns_support   = true
  tags                 = merge(local.common_tags)
}