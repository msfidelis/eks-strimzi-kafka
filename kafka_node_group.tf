resource "aws_eks_node_group" "kafka" {

  cluster_name    = aws_eks_cluster.main.name
  node_group_name = format("%s-kafka-brokers", aws_eks_cluster.main.name)
  node_role_arn   = aws_iam_role.eks_nodes_roles.arn

  subnet_ids = [
    aws_subnet.private_subnet_1a.id,
    aws_subnet.private_subnet_1b.id,
    aws_subnet.private_subnet_1c.id
  ]

  instance_types = var.kafka_instances_sizes

  scaling_config {
    desired_size = lookup(var.kafka_scale_options, "desired")
    max_size     = lookup(var.kafka_scale_options, "max")
    min_size     = lookup(var.kafka_scale_options, "min")
  }

  labels = {
    NodeGroupType = "kafka"
  }

  tags = {
    "Name": format("%s-kafka-brokers", aws_eks_cluster.main.name)
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

resource "aws_security_group" "cluster_nodes_sg" {
  name   = format("%s-nodes-sg", var.cluster_name)
  vpc_id = aws_vpc.cluster_vpc.id

  egress {
    from_port = 0
    to_port   = 0

    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = format("%s-nodes-sg", var.cluster_name)
  }

}

resource "aws_security_group_rule" "nodeport" {
  cidr_blocks = ["0.0.0.0/0"]
  from_port   = 30000
  to_port     = 32768
  description = "nodeport"
  protocol    = "tcp"

  security_group_id = aws_security_group.cluster_nodes_sg.id
  type              = "ingress"
}