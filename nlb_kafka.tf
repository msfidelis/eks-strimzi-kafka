resource "aws_lb" "kafka" {
  name               = format("%s-kafka", var.cluster_name)
  internal           = var.kafka_nlb_ingress_internal
  load_balancer_type = var.kafka_nlb_ingress_type

  subnets = [
    aws_subnet.public_subnet_1a.id,
    aws_subnet.public_subnet_1b.id,
    aws_subnet.public_subnet_1c.id
  ]

  enable_deletion_protection       = var.kafka_nlb_ingress_enable_termination_protection
  enable_cross_zone_load_balancing = var.kafka_enable_cross_zone_load_balancing

  tags = {
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
  }

  depends_on = [
    helm_release.strimzi,
    helm_release.alb_ingress_controller
  ]

}

resource "aws_lb_target_group" "plaintext" {
  name     = format("%s-plaintext", var.cluster_name)
  port     = 9092
  protocol = "TCP"
  vpc_id   = aws_vpc.cluster_vpc.id
}


resource "aws_lb_listener" "plaintext" {
  load_balancer_arn = aws_lb.kafka.arn
  port              = "9092"
  protocol          = "TCP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.plaintext.arn
  }
}

resource "kubectl_manifest" "kafka_plaintext" {
  yaml_body = <<YAML
apiVersion: elbv2.k8s.aws/v1beta1
kind: TargetGroupBinding
metadata:
  name: cluster-kafka-plain-bootstrap
  namespace: strimzi
spec:
  serviceRef:
    name: cluster-kafka-plain-bootstrap
    port: 9092
  targetGroupARN: ${aws_lb_target_group.plaintext.arn}
YAML


  depends_on = [
    aws_eks_cluster.main,
    aws_eks_node_group.observability,
    helm_release.alb_ingress_controller,
    helm_release.prometheus,
    time_sleep.wait_operator
  ]

}