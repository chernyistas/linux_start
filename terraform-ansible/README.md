# Terraform + Ansible

Связка Terraform и Ansible: Terraform создаёт ВМ (Docker-контейнер), Ansible настраивает nginx.

## Что создаёт Terraform

- Docker-образ Ubuntu 18.04 с SSH
- Docker-контейнер `terraform-vm` (имитация ВМ)
- Проброс порта 2222 → 22 (SSH)
- `inventory.ini` для Ansible

## Что настраивает Ansible

- Обновляет apt cache
- Устанавливает nginx
- Создаёт `index.html`
- Запускает nginx
- Проверяет через HTTP

## Запуск

```bash
# 1. Terraform: создать инфраструктуру
terraform init
terraform apply

# 2. Добавить пароль в inventory.ini
`nano inventory.ini`
# Строка: ansible_password=root

# 3. Установить sshpass
sudo apt install -y sshpass

# 4. Ansible: настроить ВМ
ansible-playbook playbook.yml
```

## Проверка

`docker exec terraform-vm curl -s http://localhost`

## Удаление

`terraform destroy`

## Что изучил

- Связка Terraform + Ansible

- null_resource + local-exec для ожидания SSH

- templatefile для генерации inventory

- Провижининг (Terraform) + конфигурация (Ansible)

- `Ansible facts: ansible_hostname, ansible_host`

- Идемпотентность: повторный запуск → changed=0

## Безопасность
- `inventory.ini` — в `.gitignore`

- `terraform.tfstate` — в `.gitignore`

- В продакшене: SSH-ключи вместо паролей
