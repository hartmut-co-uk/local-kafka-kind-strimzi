# local-kafka-kind-strimzi

Very basic Kafka dev setup built on [KIND](https://github.com/kubernetes-sigs/kind) and [Strimzi](https://strimzi.io/).

## Getting started

### Configure
#### Topics
Topics are defined in:
`./k8s/strimzi/4_kafka-topics.yaml`

### Scipts
#### Create KIND cluster
`./scripts/kind-create.sh`

#### Bootstrap k8s resources
`./scripts/bootstrap-k8s.sh`

#### Delete KIND cluster
`./scripts/kind-delete.sh`
