# Experiment: Up and Running EKS Clusters serving Kafka Clusters with Strimzi

> This is a experimental environment to learn, test and automate [Strimzi Operator](https://strimzi.io/) features.

# Project Diagram

![Arquitetura](/docs/diagram.png)

### Deploy

```bash
terraform init 
terraform apply --auto-approve 
```

![Resources](/docs/setup.png)


### Cleanup 

```bash
terraform destroy --auto-approve
```