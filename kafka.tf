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
  yaml_body = templatefile("${path.module}/helm/kafka/kafka.yml", {
    ZOOKEEPER_DESIRED_REPLICAS = var.zookeeper_desired_replicas,
    ZOOKEEPER_REQUEST_MEMORY   = var.zookeeper_request_memory,
    ZOOKEEPER_LIMIT_MEMORY     = var.zookeeper_limit_memory
    ZOOKEEPER_REQUEST_CPU      = var.zookeeper_request_cpu,
    ZOOKEEPER_LIMIT_CPU        = var.zookeeper_limit_cpu,
    ZOOKEEPER_STORAGE_SIZE     = var.zookeeper_storage_size,
    ZOOKEEPER_STORAGE_CLASS    = var.zookeeper_storage_class,
  })

  depends_on = [
    aws_lb.kafka,
  ]

}

resource "time_sleep" "wait_operator" {
  depends_on = [
    kubectl_manifest.kafka
  ]

  destroy_duration = "60s"
}