# Terraform Practice — Docker Provider

Учебный проект по Infrastructure as Code с Terraform.

## Что делает

Описывает Docker-инфраструктуру кодом:
- Docker-сеть `terraform-network`
- Образ `nginx:latest`
- Контейнер `terraform-nginx` с пробросом порта 8080

## Запуск

```bash
terraform init
terraform plan
terraform apply
```
## Доступ

`http://localhost:8080` - страница nginx.

## Удаление

`terraform destroy`

## Что изучил 

- Провайдеры, ресурсы, data sources

- Variables и outputs

- Terraform state

- init, plan, apply, destroy

- Best practices: .gitignore для state
