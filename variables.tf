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
    "c5.large"
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


###############################
### KAFKA CAPACITY CONFIGS  ###
###############################

variable "zookeeper_instances_sizes" {
  description = "A list of EC2 instance types to use for the EKS worker nodes. These instance types should balance between cost, performance, and resource requirements for your workload."
  default = [
    "c5.large"
  ]
}

variable "zookeeper_scale_options" {
  description = "Configuration for the EKS cluster auto-scaling. It includes the minimum (min), maximum (max), and desired (desired) number of worker nodes."
  default = {
    min     = 2
    max     = 2
    desired = 2
  }
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
