


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

```bash
kubectl -n strimzi run --restart=Never --image=quay.io/strimzi/kafka:0.38.0-kafka-3.6.0 kafka-cli -- /bin/sh -c "exec tail -f /dev/null"
```

```bash
kubectl -n strimzi exec -it kafka-cli -- bin/kafka-topics.sh \
  --describe \
  --topic kafka-stress \
  --bootstrap-server cluster-kafka-plain-bootstrap:9092
```

```bash

kubectl exec -it kafka-cli -n strimzi -- bin/kafka-producer-perf-test.sh \
  --topic kafka-stress \
  --num-records 100000000 \
  --throughput -1 \
  --producer-props bootstrap.servers=cluster-kafka-plain-bootstrap:9092 \
      acks=1 \
  --record-size 100 \
  --print-metrics
```