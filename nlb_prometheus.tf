resource "aws_lb" "prometheus" {
  name               = format("%s-prometheus", var.cluster_name)
  internal           = var.prometheus_nlb_ingress_internal
  load_balancer_type = var.prometheus_nlb_ingress_type

  subnets = [
    aws_subnet.public_subnet_1a.id,
    aws_subnet.public_subnet_1b.id,
    aws_subnet.public_subnet_1c.id
  ]

  enable_deletion_protection       = var.prometheus_nlb_ingress_enable_termination_protection
  enable_cross_zone_load_balancing = var.prometheus_enable_cross_zone_load_balancing

  tags = {
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
  }
}

resource "aws_lb_target_group" "grafana" {
  name     = format("%s-grafana", var.cluster_name)
  port     = 30080
  protocol = "TCP"
  vpc_id   = aws_vpc.cluster_vpc.id
}



resource "aws_lb_listener" "grafana" {
  load_balancer_arn = aws_lb.prometheus.arn
  port              = "80"
  protocol          = "TCP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.grafana.arn
  }
}

resource "kubectl_manifest" "grafana" {
  yaml_body = <<YAML
apiVersion: elbv2.k8s.aws/v1beta1
kind: TargetGroupBinding
metadata:
  name: prometheus-grafana
  namespace: prometheus
spec:
  serviceRef:
    name: prometheus-grafana
    port: 80
  targetGroupARN: ${aws_lb_target_group.grafana.arn}
YAML


  depends_on = [
    aws_eks_cluster.main,
    aws_eks_node_group.observability,
    helm_release.alb_ingress_controller,
    helm_release.prometheus
  ]

}