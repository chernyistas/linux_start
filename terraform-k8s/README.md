# Terraform + Kubernetes Practice

Учебный проект: управление K8s-ресурсами через Terraform.

## Что создаёт

- Namespace `terraform-demo`
- Deployment `flask-demo` (2 Pod'а Flask)
- Service `flask-demo-service` (ClusterIP)

## Запуск

```
terraform init
terraform plan
terraform apply
```
## Проверка

`kubectl get all -n terraform-demo`

## Доступ

```
kubectl port-forward -n terraform-demo svc/flask-demo-service 8080:80
curl http://localhost:8080/
```

## Удаление

`terraform destroy`

## Что изучил

- Kubernetes provider
- Namespace, Deployment, Service как Terraform resources
- Ссылки между ресурсами (зависимости)
- State, plan, apply, destroy

