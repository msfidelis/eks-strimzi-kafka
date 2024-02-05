
resource "helm_release" "strimzi" {

  name             = "strimzi"
  chart            = "strimzi-kafka-operator"
  repository       = "oci://quay.io/strimzi-helm"
  namespace        = "strimzi"
  create_namespace = true


  values = [
    "${file("./helm/kafka/values.yml")}"
  ]


  depends_on = [
    aws_eks_cluster.main,
    aws_eks_node_group.observability,
    kubernetes_config_map.aws-auth
  ]
}