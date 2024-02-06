resource "kubectl_manifest" "configmap" {
  yaml_body = templatefile("${path.module}/helm/kafka/configmap.yml", {})

  depends_on = [
    aws_eks_cluster.main,
    aws_eks_node_group.kafka,
    aws_eks_node_group.zookeeper,
    helm_release.strimzi
  ]

}

resource "kubectl_manifest" "podmonitor" {
  yaml_body = templatefile("${path.module}/helm/kafka/podmonitor.yml", {})

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

    KAFKA_DESIRED_REPLICAS = var.kafka_desired_replicas,
    KAFKA_REQUEST_MEMORY   = var.kafka_request_memory,
    KAFKA_LIMIT_MEMORY     = var.kafka_limit_memory
    KAFKA_REQUEST_CPU      = var.kafka_request_cpu,
    KAFKA_LIMIT_CPU        = var.kafka_limit_cpu,
    KAFKA_STORAGE_SIZE     = var.kafka_storage_size,
    KAFKA_STORAGE_CLASS    = var.kafka_storage_class,

    KAFKA_XMS                 = var.kafka_xms
    KAFKA_XMX                 = var.kafka_xmx
    KAFKA_REPLICATION_FACTOR  = var.kafka_replication_factor
    KAFKA_MIN_INSYNC_REPLICAS = var.kafka_min_insync_replicas
    KAFKA_REQUEST_MAX_BYTES   = var.kafka_request_max_bytes

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