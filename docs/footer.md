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