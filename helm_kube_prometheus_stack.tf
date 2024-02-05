
resource "helm_release" "prometheus" {

  name             = "prometheus"
  chart            = "kube-prometheus-stack"
  repository       = "https://prometheus-community.github.io/helm-charts"
  namespace        = "prometheus"
  create_namespace = true

  version = "45.8.0"

  values = [
    "${file("./helm/prometheus/values.yml")}"
  ]


  depends_on = [
    aws_eks_cluster.main,
    aws_eks_node_group.observability,
    kubernetes_config_map.aws-auth
  ]
}