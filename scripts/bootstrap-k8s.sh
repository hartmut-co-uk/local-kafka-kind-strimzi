#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# strimzi kafka
kubectl create namespace kafka
kubectl create -n kafka -f "${SCRIPT_DIR}/../k8s/strimzi/1_strimzi-cluster-operator-0.43.0.yaml"
kubectl apply -n kafka -f "${SCRIPT_DIR}/../k8s/strimzi/2_kafka-with-dual-role-kraft-nodes-ephemeral.yaml"
kubectl create -n kafka -f "${SCRIPT_DIR}/../k8s/strimzi/3_strimzi-topic-operator-0.43.0.yaml"
kubectl create -n kafka -f "${SCRIPT_DIR}/../k8s/strimzi/4_kafka-topics.yaml"

## prometheus
#kubectl create namespace monitoring
#kubectl create -n monitoring -f "${SCRIPT_DIR}/../k8s/monitoring/1_prometheus-operator-0.71.2.yaml"
#kubectl apply -n monitoring -f "${SCRIPT_DIR}/../k8s/monitoring/2_prometheus_rbac.yaml"
#kubectl apply -n monitoring -f "${SCRIPT_DIR}/../k8s/monitoring/3_prometheus_instance.yaml"
#kubectl apply -n monitoring -f "${SCRIPT_DIR}/../k8s/monitoring/4_service_monitor.yaml"
#
## grafana
#helm upgrade -n monitoring -i grafana-operator oci://ghcr.io/grafana/helm-charts/grafana-operator --version v5.6.3
#kubectl apply -n monitoring -f "${SCRIPT_DIR}/../k8s/monitoring/10_grafana_instance.yaml"
#kubectl apply -n monitoring -f "${SCRIPT_DIR}/../k8s/monitoring/11_grafana_dashboards.yaml"

# demo
kubectl create namespace demo
