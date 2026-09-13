# Установка мониторинга в Kubernetes через Helm

## 1. Установка Helm
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

## 2. Добавление репозитория
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

## 3. Создание namespace
kubectl create namespace monitoring

## 4. Установка kube-prometheus-stack
helm install monitoring prometheus-community/kube-prometheus-stack \
  --namespace monitoring \
  --set grafana.service.type=NodePort \
  --set grafana.service.nodePort=30080

## 5. Проверка
kubectl get pods -n monitoring

## 6. Пароль Grafana
kubectl get secret -n monitoring monitoring-grafana -o jsonpath="{.data.admin-password}" | base64 -d ; echo

## 7. Доступ к Grafana
kubectl port-forward --address 0.0.0.0 -n monitoring service/monitoring-grafana 3000:80
# Открыть http://<IP_VM>:3000 (admin / пароль из шага 6)
