#########################
###  GENERAL CONFIGS  ###
#########################

variable "cluster_name" {
  description = "The name of the Amazon EKS cluster. This is a unique identifier for your EKS cluster within the AWS region."
  default     = "eks-kafka"
}

variable "aws_region" {
  description = "AWS region where the EKS cluster will be deployed. This should be set to the region where you want your Kubernetes resources to reside."
  default     = "us-east-1"
}

variable "k8s_version" {
  description = "The version of Kubernetes to use for the EKS cluster. This version should be compatible with the AWS EKS service and other infrastructure components."
  default     = "1.29"
}

###############################
### KAFKA CAPACITY CONFIGS  ###
###############################

variable "kafka_instances_sizes" {
  description = "A list of EC2 instance types to use for the EKS worker nodes. These instance types should balance between cost, performance, and resource requirements for your workload."
  default = [
    "c6a.2xlarge"
  ]
}

variable "kafka_scale_options" {
  description = "Configuration for the EKS cluster auto-scaling. It includes the minimum (min), maximum (max), and desired (desired) number of worker nodes."
  default = {
    min     = 4
    max     = 4
    desired = 4
  }
}

variable "kafka_desired_replicas" {
  type    = number
  default = 4
}

variable "kafka_replication_factor" {
  type    = number
  default = 3
}

variable "kafka_min_insync_replicas" {
  type    = number
  default = 2
}

variable "kafka_request_max_bytes" {
  type    = number
  default = 2147483647
}

variable "kafka_request_memory" {
  default = "8Gi"
}

variable "kafka_limit_memory" {
  default = "16Gi"
}

variable "kafka_request_cpu" {
  default = "2"
}

variable "kafka_limit_cpu" {
  default = "2"
}

variable "kafka_storage_size" {
  default = "20Gi"
}

variable "kafka_storage_class" {
  default = "gp2"
}


variable "kafka_xms" {
  default = "4g"
}

variable "kafka_xmx" {
  default = "6g"
}

#######################################
###          KAFKA CONFIGS          ###
#######################################

variable "kafka_nlb_ingress_type" {
  type        = string
  description = "Specifies the type of ingress to be used for Kafka, such as 'network', determining how the NLB (Network Load Balancer) handles incoming traffic to the Kafka brokers."
  default     = "network"
}

variable "kafka_nlb_ingress_internal" {
  type        = string
  description = "Indicates whether the Network Load Balancer (NLB) for the Kafka brokers should be internal ('true') or external ('false'), controlling the scope of access to within the AWS network or from the internet, respectively."
  default     = "true"
}

variable "kafka_nlb_ingress_enable_termination_protection" {
  type        = bool
  description = "Determines if termination protection is enabled for the Network Load Balancer (NLB) associated with the Kafka brokers, preventing accidental deletion."
  default     = false
}

variable "kafka_enable_cross_zone_load_balancing" {
  type        = bool
  description = "Controls whether cross-zone load balancing is enabled for the Network Load Balancer (NLB) associated with the Kafka brokers, allowing even traffic distribution across all availability zones."
  default     = false
}


###################################
### ZOOKEEPER CAPACITY CONFIGS  ###
###################################

variable "zookeeper_instances_sizes" {
  description = "Specifies the sizes of EC2 instances for Zookeeper nodes within the EKS cluster. Optimal instance types are chosen based on the balance between cost, performance, and resource requirements for Zookeeper."
  default = [
    "c5.large"
  ]
}

variable "zookeeper_scale_options" {
  description = "Defines the scaling options for the Zookeeper nodes in the EKS cluster, including the minimum, maximum, and desired number of nodes to ensure consistent performance and fault tolerance."
  default = {
    min     = 3
    max     = 3
    desired = 3
  }
}

variable "zookeeper_desired_replicas" {
  description = "Specifies the desired number of Zookeeper replicas for handling distributed coordination tasks efficiently and reliably."
  type        = number
  default     = 3
}

variable "zookeeper_request_memory" {
  description = "Defines the memory request for each Zookeeper pod, which guarantees the specified amount of memory for proper operation."
  default     = "8Gi"
}

variable "zookeeper_limit_memory" {
  description = "Sets the maximum memory limit for each Zookeeper pod, ensuring that the pod does not exceed this amount to maintain cluster stability."
  default     = "16Gi"
}

variable "zookeeper_request_cpu" {
  description = "Determines the CPU request for each Zookeeper pod, reserving the specified amount of CPU resources for optimal performance."
  default     = "2"
}

variable "zookeeper_limit_cpu" {
  description = "Specifies the maximum CPU limit for each Zookeeper pod, preventing the pod from consuming more CPU resources than this limit."
  default     = "2"
}

variable "zookeeper_storage_size" {
  description = "Allocates the size of the persistent storage for each Zookeeper node, ensuring sufficient space for data storage and log retention."
  default     = "20Gi"
}

variable "zookeeper_storage_class" {
  description = "Defines the storage class to be used for Zookeeper persistent storage, impacting the performance and availability of the storage."
  default     = "gp2"
}



#######################################
### OBSERVABILITY CAPACITY CONFIGS  ###
#######################################

variable "observability_instances_sizes" {
  description = "A list of EC2 instance types to use for the EKS worker nodes. These instance types should balance between cost, performance, and resource requirements for your workload."
  default = [
    "t3.large"
  ]
}

variable "observability_scale_options" {
  description = "Configuration for the EKS cluster auto-scaling. It includes the minimum (min), maximum (max), and desired (desired) number of worker nodes."
  default = {
    min     = 2
    max     = 2
    desired = 2
  }
}

#######################################
###     OBSERVABILITY CONFIGS       ###
#######################################

variable "prometheus_nlb_ingress_type" {
  type        = string
  description = "Defines the type of ingress to be used for Prometheus, such as 'network', determining how the NLB (Network Load Balancer) handles incoming traffic to the Prometheus server."
  default     = "network"
}

variable "prometheus_nlb_ingress_internal" {
  type        = string
  description = "Indicates whether the Network Load Balancer (NLB) for the Prometheus server should be internal ('true') or external ('false'), controlling the scope of access to within the AWS network or from the internet, respectively."
  default     = "false"
}

variable "prometheus_nlb_ingress_enable_termination_protection" {
  type        = bool
  description = "Determines if termination protection is enabled for the Network Load Balancer (NLB) associated with the Prometheus server, preventing accidental deletion."
  default     = false
}

variable "prometheus_enable_cross_zone_load_balancing" {
  type        = bool
  description = "Controls whether cross-zone load balancing is enabled for the Network Load Balancer (NLB) associated with the Prometheus server, allowing even traffic distribution across all availability zones."
  default     = false
}


#######################################
###    GENERAL CAPACITY CONFIGS     ###
#######################################

variable "general_instances_sizes" {
  description = "A list of EC2 instance types to use for the EKS worker nodes. These instance types should balance between cost, performance, and resource requirements for your workload."
  default = [
    "t3.large"
  ]
}

variable "general_scale_options" {
  description = "Configuration for the EKS cluster auto-scaling. It includes the minimum (min), maximum (max), and desired (desired) number of worker nodes."
  default = {
    min     = 2
    max     = 2
    desired = 2
  }
}



#########################
###  ROUTE53 CONFIGS  ###
#########################

variable "cluster_private_zone" {
  type        = string
  description = "The private DNS zone name for the EKS cluster in AWS Route53. This zone is used for internal DNS resolution within the cluster."
  default     = "k8s.cluster"
}

#########################
###   ADDONS CONFIGS  ###
#########################

variable "addon_cni_version" {
  type        = string
  description = "Specifies the version of the AWS VPC CNI (Container Network Interface) plugin to use, which manages the network interfaces for pod networking."
  default     = "v1.14.1-eksbuild.1"
}

variable "addon_coredns_version" {
  type        = string
  description = "Defines the version of CoreDNS to use, a DNS server/forwarder that is integral to internal Kubernetes DNS resolution."
  default     = "v1.11.1-eksbuild.4"
}

variable "addon_kubeproxy_version" {
  type        = string
  description = "Sets the version of Kubeproxy to be used, which handles Kubernetes network services like forwarding the requests to correct containers."
  default     = "v1.29.0-eksbuild.1"
}

variable "addon_csi_version" {
  type        = string
  description = "Indicates the version of the Container Storage Interface (CSI) driver to use for managing storage volumes in Kubernetes."
  default     = "v1.26.1-eksbuild.1"
}

variable "default_tags" {
  type        = map(string)
  description = "A map of default tags to apply to all resources. These tags can help with identifying and organizing resources within the AWS environment."
  default = {
    Environment = "prod"
    Foo         = "Bar"
    Ping        = "Pong"
  }
}
