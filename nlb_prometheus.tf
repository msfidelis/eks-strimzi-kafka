resource "aws_lb" "prometheus" {
  name               = format("%s-prometheus", var.cluster_name)
  internal           = var.nlb_ingress_internal
  load_balancer_type = var.nlb_ingress_type

  subnets = [
    aws_subnet.public_subnet_1a.id,
    aws_subnet.public_subnet_1b.id,
    aws_subnet.public_subnet_1c.id
  ]

  enable_deletion_protection       = var.nlb_ingress_enable_termination_protection
  enable_cross_zone_load_balancing = var.enable_cross_zone_load_balancing

  tags = {
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
  }
}
