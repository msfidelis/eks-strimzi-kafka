<!-- BEGIN_TF_DOCS -->
# Experiment: Up and Running EKS Clusters serving Kafka Clusters with Strimzi

> This is a experimental environment to learn, test and automate [Strimzi Operator](https://strimzi.io/) features.

# Project Diagram

![Arquitetura](/docs/diagram.png)

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | ~> 2.0 |
| <a name="requirement_kubectl"></a> [kubectl](#requirement\_kubectl) | ~> 1.14 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | ~> 2.0 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | ~> 3.1.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.35.0 |
| <a name="provider_helm"></a> [helm](#provider\_helm) | 2.12.1 |
| <a name="provider_kubectl"></a> [kubectl](#provider\_kubectl) | 1.14.0 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | 2.25.2 |
| <a name="provider_time"></a> [time](#provider\_time) | 0.10.0 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | 3.1.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_eip.vpc_iep](https://registry.terraform.io/providers/aws/latest/docs/resources/eip) | resource |
| [aws_eks_addon.cni](https://registry.terraform.io/providers/aws/latest/docs/resources/eks_addon) | resource |
| [aws_eks_addon.coredns](https://registry.terraform.io/providers/aws/latest/docs/resources/eks_addon) | resource |
| [aws_eks_addon.csi_driver](https://registry.terraform.io/providers/aws/latest/docs/resources/eks_addon) | resource |
| [aws_eks_addon.kubeproxy](https://registry.terraform.io/providers/aws/latest/docs/resources/eks_addon) | resource |
| [aws_eks_cluster.main](https://registry.terraform.io/providers/aws/latest/docs/resources/eks_cluster) | resource |
| [aws_eks_node_group.general](https://registry.terraform.io/providers/aws/latest/docs/resources/eks_node_group) | resource |
| [aws_eks_node_group.kafka](https://registry.terraform.io/providers/aws/latest/docs/resources/eks_node_group) | resource |
| [aws_eks_node_group.observability](https://registry.terraform.io/providers/aws/latest/docs/resources/eks_node_group) | resource |
| [aws_eks_node_group.zookeeper](https://registry.terraform.io/providers/aws/latest/docs/resources/eks_node_group) | resource |
| [aws_iam_instance_profile.nodes](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_instance_profile) | resource |
| [aws_iam_openid_connect_provider.eks](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_openid_connect_provider) | resource |
| [aws_iam_policy.aws_load_balancer_controller_policy](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.csi_driver](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy_attachment.aws_load_balancer_controller_policy](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_policy_attachment) | resource |
| [aws_iam_policy_attachment.csi_driver](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_policy_attachment) | resource |
| [aws_iam_role.alb_controller](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.eks_cluster_role](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.eks_nodes_roles](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.cloudwatch](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.cni](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.ecr](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.eks-cluster-cluster](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.eks-cluster-service](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.node](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.ssm](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_internet_gateway.gw](https://registry.terraform.io/providers/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_kms_alias.eks](https://registry.terraform.io/providers/aws/latest/docs/resources/kms_alias) | resource |
| [aws_kms_key.eks](https://registry.terraform.io/providers/aws/latest/docs/resources/kms_key) | resource |
| [aws_lb.kafka](https://registry.terraform.io/providers/aws/latest/docs/resources/lb) | resource |
| [aws_lb.prometheus](https://registry.terraform.io/providers/aws/latest/docs/resources/lb) | resource |
| [aws_lb_listener.grafana](https://registry.terraform.io/providers/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_listener.plaintext](https://registry.terraform.io/providers/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_target_group.grafana](https://registry.terraform.io/providers/aws/latest/docs/resources/lb_target_group) | resource |
| [aws_lb_target_group.plaintext](https://registry.terraform.io/providers/aws/latest/docs/resources/lb_target_group) | resource |
| [aws_nat_gateway.nat](https://registry.terraform.io/providers/aws/latest/docs/resources/nat_gateway) | resource |
| [aws_route.nat_access](https://registry.terraform.io/providers/aws/latest/docs/resources/route) | resource |
| [aws_route.public_internet_access](https://registry.terraform.io/providers/aws/latest/docs/resources/route) | resource |
| [aws_route_table.igw_route_table](https://registry.terraform.io/providers/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.nat](https://registry.terraform.io/providers/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.private1a](https://registry.terraform.io/providers/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.private1b](https://registry.terraform.io/providers/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.private1c](https://registry.terraform.io/providers/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.public_1a](https://registry.terraform.io/providers/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.public_1b](https://registry.terraform.io/providers/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.public_1c](https://registry.terraform.io/providers/aws/latest/docs/resources/route_table_association) | resource |
| [aws_security_group.cluster_nodes_sg](https://registry.terraform.io/providers/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.nodeport](https://registry.terraform.io/providers/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.nodeports](https://registry.terraform.io/providers/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_subnet.private_subnet_1a](https://registry.terraform.io/providers/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.private_subnet_1b](https://registry.terraform.io/providers/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.private_subnet_1c](https://registry.terraform.io/providers/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.public_subnet_1a](https://registry.terraform.io/providers/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.public_subnet_1b](https://registry.terraform.io/providers/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.public_subnet_1c](https://registry.terraform.io/providers/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.cluster_vpc](https://registry.terraform.io/providers/aws/latest/docs/resources/vpc) | resource |
| [aws_vpc_ipv4_cidr_block_association.pods](https://registry.terraform.io/providers/aws/latest/docs/resources/vpc_ipv4_cidr_block_association) | resource |
| [helm_release.alb_ingress_controller](https://registry.terraform.io/providers/helm/latest/docs/resources/release) | resource |
| [helm_release.prometheus](https://registry.terraform.io/providers/helm/latest/docs/resources/release) | resource |
| [helm_release.strimzi](https://registry.terraform.io/providers/helm/latest/docs/resources/release) | resource |
| [kubectl_manifest.configmap](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs/resources/manifest) | resource |
| [kubectl_manifest.grafana](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs/resources/manifest) | resource |
| [kubectl_manifest.kafka](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs/resources/manifest) | resource |
| [kubectl_manifest.kafka_plaintext](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs/resources/manifest) | resource |
| [kubectl_manifest.podmonitor](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs/resources/manifest) | resource |
| [kubernetes_config_map.aws-auth](https://registry.terraform.io/providers/kubernetes/latest/docs/resources/config_map) | resource |
| [time_sleep.wait_operator](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/sleep) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_eks_cluster_auth.default](https://registry.terraform.io/providers/aws/latest/docs/data-sources/eks_cluster_auth) | data source |
| [aws_iam_policy_document.aws_load_balancer_controller_assume_role](https://registry.terraform.io/providers/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.aws_load_balancer_controller_policy](https://registry.terraform.io/providers/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.csi_driver](https://registry.terraform.io/providers/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.eks_cluster_role](https://registry.terraform.io/providers/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.eks_nodes_role](https://registry.terraform.io/providers/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_ssm_parameter.eks](https://registry.terraform.io/providers/aws/latest/docs/data-sources/ssm_parameter) | data source |
| [tls_certificate.eks](https://registry.terraform.io/providers/tls/latest/docs/data-sources/certificate) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_addon_cni_version"></a> [addon\_cni\_version](#input\_addon\_cni\_version) | Specifies the version of the AWS VPC CNI (Container Network Interface) plugin to use, which manages the network interfaces for pod networking. | `string` | `"v1.14.1-eksbuild.1"` | no |
| <a name="input_addon_coredns_version"></a> [addon\_coredns\_version](#input\_addon\_coredns\_version) | Defines the version of CoreDNS to use, a DNS server/forwarder that is integral to internal Kubernetes DNS resolution. | `string` | `"v1.11.1-eksbuild.4"` | no |
| <a name="input_addon_csi_version"></a> [addon\_csi\_version](#input\_addon\_csi\_version) | Indicates the version of the Container Storage Interface (CSI) driver to use for managing storage volumes in Kubernetes. | `string` | `"v1.26.1-eksbuild.1"` | no |
| <a name="input_addon_kubeproxy_version"></a> [addon\_kubeproxy\_version](#input\_addon\_kubeproxy\_version) | Sets the version of Kubeproxy to be used, which handles Kubernetes network services like forwarding the requests to correct containers. | `string` | `"v1.29.0-eksbuild.1"` | no |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS region where the EKS cluster will be deployed. This should be set to the region where you want your Kubernetes resources to reside. | `string` | `"us-east-1"` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | The name of the Amazon EKS cluster. This is a unique identifier for your EKS cluster within the AWS region. | `string` | `"eks-kafka"` | no |
| <a name="input_cluster_private_zone"></a> [cluster\_private\_zone](#input\_cluster\_private\_zone) | The private DNS zone name for the EKS cluster in AWS Route53. This zone is used for internal DNS resolution within the cluster. | `string` | `"k8s.cluster"` | no |
| <a name="input_default_tags"></a> [default\_tags](#input\_default\_tags) | A map of default tags to apply to all resources. These tags can help with identifying and organizing resources within the AWS environment. | `map(string)` | <pre>{<br>  "Environment": "prod",<br>  "Foo": "Bar",<br>  "Ping": "Pong"<br>}</pre> | no |
| <a name="input_general_instances_sizes"></a> [general\_instances\_sizes](#input\_general\_instances\_sizes) | A list of EC2 instance types to use for the EKS worker nodes. These instance types should balance between cost, performance, and resource requirements for your workload. | `list` | <pre>[<br>  "t3.large"<br>]</pre> | no |
| <a name="input_general_scale_options"></a> [general\_scale\_options](#input\_general\_scale\_options) | Configuration for the EKS cluster auto-scaling. It includes the minimum (min), maximum (max), and desired (desired) number of worker nodes. | `map` | <pre>{<br>  "desired": 2,<br>  "max": 2,<br>  "min": 2<br>}</pre> | no |
| <a name="input_k8s_version"></a> [k8s\_version](#input\_k8s\_version) | The version of Kubernetes to use for the EKS cluster. This version should be compatible with the AWS EKS service and other infrastructure components. | `string` | `"1.29"` | no |
| <a name="input_kafka_desired_replicas"></a> [kafka\_desired\_replicas](#input\_kafka\_desired\_replicas) | n/a | `number` | `4` | no |
| <a name="input_kafka_enable_cross_zone_load_balancing"></a> [kafka\_enable\_cross\_zone\_load\_balancing](#input\_kafka\_enable\_cross\_zone\_load\_balancing) | Controls whether cross-zone load balancing is enabled for the Network Load Balancer (NLB) associated with the Kafka brokers, allowing even traffic distribution across all availability zones. | `bool` | `false` | no |
| <a name="input_kafka_instances_sizes"></a> [kafka\_instances\_sizes](#input\_kafka\_instances\_sizes) | A list of EC2 instance types to use for the EKS worker nodes. These instance types should balance between cost, performance, and resource requirements for your workload. | `list` | <pre>[<br>  "c6a.2xlarge"<br>]</pre> | no |
| <a name="input_kafka_limit_cpu"></a> [kafka\_limit\_cpu](#input\_kafka\_limit\_cpu) | n/a | `string` | `"2"` | no |
| <a name="input_kafka_limit_memory"></a> [kafka\_limit\_memory](#input\_kafka\_limit\_memory) | n/a | `string` | `"16Gi"` | no |
| <a name="input_kafka_min_insync_replicas"></a> [kafka\_min\_insync\_replicas](#input\_kafka\_min\_insync\_replicas) | n/a | `number` | `2` | no |
| <a name="input_kafka_nlb_ingress_enable_termination_protection"></a> [kafka\_nlb\_ingress\_enable\_termination\_protection](#input\_kafka\_nlb\_ingress\_enable\_termination\_protection) | Determines if termination protection is enabled for the Network Load Balancer (NLB) associated with the Kafka brokers, preventing accidental deletion. | `bool` | `false` | no |
| <a name="input_kafka_nlb_ingress_internal"></a> [kafka\_nlb\_ingress\_internal](#input\_kafka\_nlb\_ingress\_internal) | Indicates whether the Network Load Balancer (NLB) for the Kafka brokers should be internal ('true') or external ('false'), controlling the scope of access to within the AWS network or from the internet, respectively. | `string` | `"true"` | no |
| <a name="input_kafka_nlb_ingress_type"></a> [kafka\_nlb\_ingress\_type](#input\_kafka\_nlb\_ingress\_type) | Specifies the type of ingress to be used for Kafka, such as 'network', determining how the NLB (Network Load Balancer) handles incoming traffic to the Kafka brokers. | `string` | `"network"` | no |
| <a name="input_kafka_replication_factor"></a> [kafka\_replication\_factor](#input\_kafka\_replication\_factor) | n/a | `number` | `3` | no |
| <a name="input_kafka_request_cpu"></a> [kafka\_request\_cpu](#input\_kafka\_request\_cpu) | n/a | `string` | `"2"` | no |
| <a name="input_kafka_request_max_bytes"></a> [kafka\_request\_max\_bytes](#input\_kafka\_request\_max\_bytes) | n/a | `number` | `2147483647` | no |
| <a name="input_kafka_request_memory"></a> [kafka\_request\_memory](#input\_kafka\_request\_memory) | n/a | `string` | `"8Gi"` | no |
| <a name="input_kafka_scale_options"></a> [kafka\_scale\_options](#input\_kafka\_scale\_options) | Configuration for the EKS cluster auto-scaling. It includes the minimum (min), maximum (max), and desired (desired) number of worker nodes. | `map` | <pre>{<br>  "desired": 4,<br>  "max": 4,<br>  "min": 4<br>}</pre> | no |
| <a name="input_kafka_storage_class"></a> [kafka\_storage\_class](#input\_kafka\_storage\_class) | n/a | `string` | `"gp2"` | no |
| <a name="input_kafka_storage_size"></a> [kafka\_storage\_size](#input\_kafka\_storage\_size) | n/a | `string` | `"20Gi"` | no |
| <a name="input_kafka_xms"></a> [kafka\_xms](#input\_kafka\_xms) | n/a | `string` | `"4g"` | no |
| <a name="input_kafka_xmx"></a> [kafka\_xmx](#input\_kafka\_xmx) | n/a | `string` | `"6g"` | no |
| <a name="input_observability_instances_sizes"></a> [observability\_instances\_sizes](#input\_observability\_instances\_sizes) | A list of EC2 instance types to use for the EKS worker nodes. These instance types should balance between cost, performance, and resource requirements for your workload. | `list` | <pre>[<br>  "t3.large"<br>]</pre> | no |
| <a name="input_observability_scale_options"></a> [observability\_scale\_options](#input\_observability\_scale\_options) | Configuration for the EKS cluster auto-scaling. It includes the minimum (min), maximum (max), and desired (desired) number of worker nodes. | `map` | <pre>{<br>  "desired": 2,<br>  "max": 2,<br>  "min": 2<br>}</pre> | no |
| <a name="input_prometheus_enable_cross_zone_load_balancing"></a> [prometheus\_enable\_cross\_zone\_load\_balancing](#input\_prometheus\_enable\_cross\_zone\_load\_balancing) | Controls whether cross-zone load balancing is enabled for the Network Load Balancer (NLB) associated with the Prometheus server, allowing even traffic distribution across all availability zones. | `bool` | `false` | no |
| <a name="input_prometheus_nlb_ingress_enable_termination_protection"></a> [prometheus\_nlb\_ingress\_enable\_termination\_protection](#input\_prometheus\_nlb\_ingress\_enable\_termination\_protection) | Determines if termination protection is enabled for the Network Load Balancer (NLB) associated with the Prometheus server, preventing accidental deletion. | `bool` | `false` | no |
| <a name="input_prometheus_nlb_ingress_internal"></a> [prometheus\_nlb\_ingress\_internal](#input\_prometheus\_nlb\_ingress\_internal) | Indicates whether the Network Load Balancer (NLB) for the Prometheus server should be internal ('true') or external ('false'), controlling the scope of access to within the AWS network or from the internet, respectively. | `string` | `"false"` | no |
| <a name="input_prometheus_nlb_ingress_type"></a> [prometheus\_nlb\_ingress\_type](#input\_prometheus\_nlb\_ingress\_type) | Defines the type of ingress to be used for Prometheus, such as 'network', determining how the NLB (Network Load Balancer) handles incoming traffic to the Prometheus server. | `string` | `"network"` | no |
| <a name="input_zookeeper_desired_replicas"></a> [zookeeper\_desired\_replicas](#input\_zookeeper\_desired\_replicas) | Specifies the desired number of Zookeeper replicas for handling distributed coordination tasks efficiently and reliably. | `number` | `3` | no |
| <a name="input_zookeeper_instances_sizes"></a> [zookeeper\_instances\_sizes](#input\_zookeeper\_instances\_sizes) | Specifies the sizes of EC2 instances for Zookeeper nodes within the EKS cluster. Optimal instance types are chosen based on the balance between cost, performance, and resource requirements for Zookeeper. | `list` | <pre>[<br>  "c5.large"<br>]</pre> | no |
| <a name="input_zookeeper_limit_cpu"></a> [zookeeper\_limit\_cpu](#input\_zookeeper\_limit\_cpu) | Specifies the maximum CPU limit for each Zookeeper pod, preventing the pod from consuming more CPU resources than this limit. | `string` | `"2"` | no |
| <a name="input_zookeeper_limit_memory"></a> [zookeeper\_limit\_memory](#input\_zookeeper\_limit\_memory) | Sets the maximum memory limit for each Zookeeper pod, ensuring that the pod does not exceed this amount to maintain cluster stability. | `string` | `"16Gi"` | no |
| <a name="input_zookeeper_request_cpu"></a> [zookeeper\_request\_cpu](#input\_zookeeper\_request\_cpu) | Determines the CPU request for each Zookeeper pod, reserving the specified amount of CPU resources for optimal performance. | `string` | `"2"` | no |
| <a name="input_zookeeper_request_memory"></a> [zookeeper\_request\_memory](#input\_zookeeper\_request\_memory) | Defines the memory request for each Zookeeper pod, which guarantees the specified amount of memory for proper operation. | `string` | `"8Gi"` | no |
| <a name="input_zookeeper_scale_options"></a> [zookeeper\_scale\_options](#input\_zookeeper\_scale\_options) | Defines the scaling options for the Zookeeper nodes in the EKS cluster, including the minimum, maximum, and desired number of nodes to ensure consistent performance and fault tolerance. | `map` | <pre>{<br>  "desired": 3,<br>  "max": 3,<br>  "min": 3<br>}</pre> | no |
| <a name="input_zookeeper_storage_class"></a> [zookeeper\_storage\_class](#input\_zookeeper\_storage\_class) | Defines the storage class to be used for Zookeeper persistent storage, impacting the performance and availability of the storage. | `string` | `"gp2"` | no |
| <a name="input_zookeeper_storage_size"></a> [zookeeper\_storage\_size](#input\_zookeeper\_storage\_size) | Allocates the size of the persistent storage for each Zookeeper node, ensuring sufficient space for data storage and log retention. | `string` | `"20Gi"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_bootstrap_servers_plaintext"></a> [bootstrap\_servers\_plaintext](#output\_bootstrap\_servers\_plaintext) | n/a |
| <a name="output_grafana_default_pass"></a> [grafana\_default\_pass](#output\_grafana\_default\_pass) | n/a |
| <a name="output_grafana_default_user"></a> [grafana\_default\_user](#output\_grafana\_default\_user) | n/a |
| <a name="output_grafana_url"></a> [grafana\_url](#output\_grafana\_url) | n/a |

### Field Notes

#### List Kafka Nodes

```bash
kubectl get nodes -l NodeGroupType=kafka -o wide
```

#### List Observability Nodes

```bash
kubectl get nodes -l NodeGroupType=observability -o wide
```

#### List General Nodes

```bash
kubectl get nodes -l NodeGroupType=general -o wide
```

#### List Zookeeper Nodes

```bash
kubectl get nodes -l NodeGroupType=zookeeper -o wide
```

#### List Strimzipodsets

```bash
kubectl get strimzipodsets -n strimzi
```

#### List Kafka Configs

```bash
kubectl get kafka -n strimzi
```

#### Kafka Stress - Produce Messages

```bash
/usr/local/bin/kafka-stress --bootstrap-servers eks-kafka-kafka-1dfc54296e6bfac8.elb.us-east-1.amazonaws.com:9092 --events 300000 --topic kafka-stress
```

#### Kafka Stress - Consume Messages

```bash
/usr/local/bin/kafka-stress --bootstrap-servers eks-kafka-kafka-1dfc54296e6bfac8.elb.us-east-1.amazonaws.com:9092 --test-mode consumer --topic kafka-stress --consumer-group teste
```

#### Deploy "kafka-cli" to manage resources

```bash
kubectl -n strimzi run --restart=Never --image=quay.io/strimzi/kafka:0.38.0-kafka-3.6.0 kafka-cli -- /bin/sh -c "exec tail -f /dev/null"
```

```bash
kubectl -n strimzi exec -it kafka-cli -- bin/kafka-topics.sh \
  --describe \
  --topic kafka-stress \
  --bootstrap-server cluster-kafka-plain-bootstrap:9092
```

### References

* [Github - Strimzi Kafka Operator](https://github.com/strimzi/strimzi-kafka-operator)
* [Deploying and scaling Apache Kafka on Amazon EKS](https://aws.amazon.com/pt/blogs/containers/deploying-and-scaling-apache-kafka-on-amazon-eks/)
* [Using Strimzi with Amazon Network load balancers](https://strimzi.io/blog/2020/01/02/using-strimzi-with-amazon-nlb-loadbalancers/)
* [Apache Kafka on Kubernetes with Strimzi](https://piotrminkowski.com/2023/11/06/apache-kafka-on-kubernetes-with-strimzi/)
<!-- END_TF_DOCS -->