resource "kubectl_manifest" "configmap" {
  yaml_body = templatefile("${path.module}/helm/kafka/configmap.yml", {})

  depends_on = [
    aws_eks_cluster.main,
    aws_eks_node_group.kafka,
    aws_eks_node_group.zookeeper,
    helm_release.strimzi
  ]

}

resource "kubectl_manifest" "kafka" {
  yaml_body = templatefile("${path.module}/helm/kafka/kafka.yml", {})

  depends_on = [
    aws_lb.kafka
  ]

}

resource "time_sleep" "wait_operator" {
  depends_on = [
    kubectl_manifest.kafka
  ]

  destroy_duration = "60s"
}