module "zones" {
  source  = "terraform-aws-modules/route53/aws//modules/zones"
  version = "~> 2.0"

  zones = {
    "assignment.bizzabo.com" = {
      comment = "DevOps Eng @ Bizzabo - Assignment"
    tags = merge(local.common_tags) }


  }

  tags = merge(local.common_tags)
}

module "records" {
  source  = "terraform-aws-modules/route53/aws//modules/records"
  version = "~> 2.0"

  zone_name = keys(module.zones.route53_zone_zone_id)[0]

  records = [
    {
      name           = "alb"
      type           = "CNAME"
      ttl            = 5
      records        = [module.alb.lb_dns_name]
      set_identifier = "europe"
      geolocation_routing_policy = {
        continent = "EU"
      }
    }
  ]

  depends_on = [module.zones]
}
