


```bash
kubectl get nodes -l NodeGroupType=kafka -o wide
```

```bash
kubectl get nodes -l NodeGroupType=observability -o wide
```

```bash
kubectl get nodes -l NodeGroupType=general -o wide
```

```bash
kubectl get nodes -l NodeGroupType=zookeeper -o wide
```

```bash
kubectl get strimzipodsets -n strimzi
```


```bash
kafka-stress --bootstrap-servers eks-kafka-kafka-1dfc54296e6bfac8.elb.us-east-1.amazonaws.com:9092 --events 30000 --topic kafka-stress
```