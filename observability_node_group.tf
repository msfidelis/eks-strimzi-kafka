resource "aws_eks_node_group" "observability" {

  cluster_name    = aws_eks_cluster.main.name
  node_group_name = format("%s-observability-brokers", aws_eks_cluster.main.name)
  node_role_arn   = aws_iam_role.eks_nodes_roles.arn

  subnet_ids = [
    aws_subnet.private_subnet_1a.id,
    aws_subnet.private_subnet_1b.id,
    aws_subnet.private_subnet_1c.id
  ]

  instance_types = var.observability_instances_sizes

  scaling_config {
    desired_size = lookup(var.observability_scale_options, "desired")
    max_size     = lookup(var.observability_scale_options, "max")
    min_size     = lookup(var.observability_scale_options, "min")
  }

  labels = {
    NodeGroupType = "observability"
  }

  tags = {
    "Name": format("%s-observability-brokers", aws_eks_cluster.main.name)
    "kubernetes.io/cluster/${var.cluster_name}"     = "owned"
  }

  lifecycle {
    ignore_changes = [
      scaling_config[0].desired_size
    ]
  }

  depends_on = [
    kubernetes_config_map.aws-auth
  ]

  timeouts {
    create = "60m"
    update = "2h"
    delete = "2h"
  }
}