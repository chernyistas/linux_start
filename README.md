# DevOps Practice — 30 Days Linux for DevOps
![CI/CD Flask](https://github.com/chernyistas/linux_start/actions/workflows/deploy.yml/badge.svg)
![CI/CD Ansible](https://github.com/chernyistas/linux_start/actions/workflows/ansible.yml/badge.svg)
![License](https://img.shields.io/badge/license-MIT-blue.svg)
![Docker](https://img.shields.io/badge/docker-29.x-blue)
![Kubernetes](https://img.shields.io/badge/kubernetes-1.37-blue)
Мой учебный проект по пути в DevOps. Здесь я практикую Linux, Docker, Kubernetes, CI/CD и мониторинг.

---

## 🎯 Что я освоил

| День | Тема | Что сделал |
|------|------|------------|
| 1–3 | Основы Linux | Навигация, файлы, права, процессы, логи, cron |
| 4 | Bash-скриптинг | Переменные, условия, циклы, скрипты бэкапа |
| 5 | Git | Инициализация, коммиты, ветки, пуш на GitHub |
| 6 | Docker | Образы, контейнеры, тома, сети, Dockerfile |
| 7 | Docker Compose | Flask + PostgreSQL + Adminer + Nginx в одном стеке |
| 8 | CI/CD | GitHub Actions: сборка и пуш образа в Docker Hub |
| 9 | Мониторинг | Prometheus + Grafana + Node Exporter + cAdvisor |
| 10 | HTTPS | Самоподписанный сертификат для Nginx |
| 11–12 | Метрики приложения | prometheus_flask_exporter + алерты в Telegram |
| 13 | Kubernetes | Манифесты для Flask, PostgreSQL, Adminer, Ingress |
| 14 | Мониторинг в K8s | kube-prometheus-stack через Helm |
| 15 | Алертинг в K8s | Alertmanager + Telegram + ServiceMonitor + PrometheusRule |
| 16 | CI/CD в K8s | GitHub Actions + self-hosted runner + автоматический деплой |
| 17 | Автомасштабирование | HPA: 2–10 Pod'ов, target CPU 70% |
| 18 | Terraform | IaC: Docker-провайдер, resources, state, variables, outputs |
| 19 | Terraform + K8s | IaC для Kubernetes: Namespace, Deployment, Service |
| 20 | Ansible | Управление конфигурациями: playbooks, handlers, templates, идемпотентность |
| 21 | Ansible Roles | Роли: defaults, vars, handlers, templates, meta |
| 22 | Ansible Vault | Шифрование секретов: create, edit, vars_files, CI/CD |
| 23 | CI/CD для Ansible | GitHub Actions + self-hosted runner (itsme) + Vault |
| 24 | Terraform + Ansible | Провижининг + конфигурация: полный пайплайн |

---

## 🧰 Стек технологий

- **ОС:** Ubuntu 24.04 (в VMware)
- **Контейнеры:** Docker, Docker Compose
- **Оркестрация:** Kubernetes (minikube)
- **CI/CD:** GitHub Actions
- **Мониторинг:** Prometheus, Grafana, Alertmanager
- **База данных:** PostgreSQL
- **Язык:** Python (Flask)
- **Веб-сервер:** Nginx

---

## 📂 Структура проекта

```text
devops-practice/
├── app/                                    # Flask-приложение
│   ├── app.py                              # Код + метрики
│   ├── requirements.txt                    # Зависимости
│   └── Dockerfile                          # Сборка образа
│
├── k8s/                                    # Манифесты Kubernetes
│   ├── postgres.yaml                       # PostgreSQL (StatefulSet + Service + Secret)
│   ├── flask-app.yaml                      # Flask (Deployment + Service)
│   ├── hpa.yaml                            # HPA: автомасштабирование Flask
│   ├── adminer.yaml                        # Adminer (Deployment + Service)
│   ├── ingress-flask.yaml                  # Ingress для Flask
│   ├── ingress-adminer.yaml                # Ingress для Adminer (rewrite-target)
│   ├── flask-servicemonitor.yaml           # ServiceMonitor для Flask (метрики)
│   ├── alerts.yaml                         # PrometheusRule: FlaskAppDown/FlaskAppAbsent
│   ├── alertmanager-telegram-values.yaml   # Helm values для Alertmanager
│   ├── alertmanager-config.yaml            # Конфиг Alertmanager (в .gitignore)
│   └── monitoring-install.md               # Инструкция по установке мониторинга
│
├── terraform/                              # Terraform (IaC)
│   ├── main.tf                             # Провайдер, ресурсы
│   ├── variables.tf                        # Переменные
│   ├── outputs.tf                          # Выходные данные
│   └── README.md                           # Описание проекта
│
├── terraform-k8s/                          # Terraform + Kubernetes
│   ├── main.tf                             # Провайдер K8s, ресурсы
│   ├── variables.tf                        # Переменные
│   ├── outputs.tf                          # Выходные данные
│   └── README.md                           # Описание
│
├── ansible/
│   ├── roles/
│   │   └── nginx/                          # Роль nginx
│   │       ├── defaults/                   # Значения по умолчанию
│   │       ├── handlers/                   # Обработчики
│   │       ├── tasks/                      # Задачи
│   │       ├── templates/                  # Jinja2-шаблоны
│   │       └── meta/                       # Метаданные
│   ├── playbook-nginx.yml                  # Playbook: вызов роли nginx
│   ├── install-docker.yml                  # Playbook: установка Docker
│   ├── setup-app.yml                       # Playbook: настройка приложения
│   ├── inventory.ini                       # Список хостов
│   ├── ansible.cfg                         # Настройки Ansible
│   ├── secrets.yml                         # Зашифрованные секреты (Vault)
│   ├── playbook-secrets.yml                # Демонстрация Vault
│   ├── README-vault.md                     # Описание Vault
│   └── README.md
│
├── terraform-ansible/                      # Terraform + Ansible
│   ├── main.tf                             # Создание контейнера + inventory
│   ├── variables.tf                        # Переменные Terraform
│   ├── outputs.tf                          # Выходные данные
│   ├── inventory.tpl                       # Шаблон inventory
│   ├── ansible.cfg                         # Настройки Ansible
│   ├── playbook.yml                        # Ansible playbook
│   └── README.md                           # Описание
│
├── .github/
│   └── workflows/
│       ├── deploy.yml                      # CI/CD: сборка + деплой в K8s
│       └── ansible.yml                     # CI/CD для Ansible
│ 
├── prometheus/                             # Конфиги Prometheus (Docker Compose)
│   ├── prometheus.yml                      # Сбор метрик
│   └── alerts.yml                          # Правила алертов
│
├── alertmanager/                           # Конфиг Alertmanager (Docker Compose)
│   └── config.yml
│
├── scripts/                                # Bash-скрипты
├── notes/                                  # Заметки по дням
├── docker-compose.yml                      # Стек Docker Compose
├── .env                                    # Пароли (в .gitignore)
├── .gitignore                              # alertmanager-config.yaml, .env, actions-runner/
└── README.md                               # Этот файл
```

---

## 🚀 Как запустить (Docker Compose)

```bash
# Клонировать репозиторий
git clone git@github.com:chernyistas/linux_start.git
cd linux_start

# Создать .env с паролями
echo "POSTGRES_USER=admin" > .env
echo "POSTGRES_PASSWORD=mysecretpassword" >> .env
echo "POSTGRES_DB=mydb" >> .env

# Запустить стек
docker compose up -d
```

### Доступные сервисы

| Сервис | Адрес |
|--------|-------|
| Flask | http://localhost:5000 |
| Nginx | http://localhost:8080 |
| Adminer | http://localhost:8081 |
| Prometheus | http://localhost:9090 |
| Grafana | http://localhost:3000 |

---

## ☸️ Как запустить (Kubernetes)

```bash
# Запустить minikube
minikube start --driver=docker

# Применить манифесты
cd k8s
kubectl apply -f postgres.yaml
kubectl apply -f flask-app.yaml
kubectl apply -f adminer.yaml
kubectl apply -f ingress-flask.yaml
kubectl apply -f ingress-adminer.yaml

# Загрузить образ Flask в minikube
minikube image load devops-practice-app:latest

# Установить мониторинг
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
kubectl create namespace monitoring
helm install monitoring prometheus-community/kube-prometheus-stack \
  --namespace monitoring \
  --set grafana.service.type=NodePort

# Доступ к Grafana
kubectl port-forward --address 0.0.0.0 -n monitoring service/monitoring-grafana 3000:80
```

---

## 📈 Мониторинг

- **Prometheus** — сбор метрик с приложения и кластера
- **Grafana** — визуализация (дашборды 315, 1860, 6417, 14282)
- **Alertmanager** — уведомления в Telegram при сбоях

---

## 🔐 CI/CD

GitHub Actions автоматически собирает образ Flask и пушит в Docker Hub при коммите в `main`.

Файл: `.github/workflows/deploy.yml`

---

## 📅 Прогресс

- [x] День 1–3: Основы Linux
- [x] День 4: Bash-скриптинг
- [x] День 5: Git
- [x] День 6: Docker
- [x] День 7: Docker Compose
- [x] День 8: CI/CD
- [x] День 9: Мониторинг
- [x] День 10: HTTPS
- [x] День 11–12: Метрики и алерты
- [x] День 13: Kubernetes
- [x] День 14: Мониторинг в Kubernetes
- [x] День 15: Алертинг в Kubernetes
- [x] День 16: CI/CD в Kubernetes
- [x] День 17: Автомасштабирование (HPA)
- [x] День 18: Terraform (IaC)
- [x] День 19: Terraform + Kubernetes
- [x] День 20: Ansible
- [x] День 21: Ansible Roles
- [x] День 22: Ansible Vault
- [x] День 23: CI/CD для Ansible
- [x] День 24: Terraform + Ansible
---

## 🎓 Итог проекта

За 24 дня я прошёл путь от `ls` до полного DevOps-стека:

| Навык | Технологии |
|-------|-----------|
| Linux | навигация, права, процессы, логи, cron |
| Bash | переменные, циклы, скрипты бэкапа |
| Git | ветки, коммиты, GitHub, SSH-ключи |
| Docker | образы, контейнеры, тома, сети, Dockerfile |
| Docker Compose | Flask + PostgreSQL + Adminer + Nginx |
| CI/CD | GitHub Actions, self-hosted runner, SHA-теги |
| Мониторинг | Prometheus, Grafana, Alertmanager |
| HTTPS | самоподписанные сертификаты |
| Метрики | prometheus_flask_exporter |
| Kubernetes | Deployments, StatefulSets, Ingress, HPA |
| Helm | kube-prometheus-stack |
| Terraform | Docker-провайдер, K8s-провайдер |
| Ansible | playbooks, roles, vault, CI/CD |
| Terraform + Ansible | провижининг + конфигурация |

## 🏗️ Архитектура
```
┌──────────────────────────────────────────────────────────┐
│ GitHub │
│ ├── main branch │
│ ├── GitHub Actions (self-hosted runner) │
│ └── Docker Hub (образы) │
└─────────────────────┬────────────────────────────────────┘
│ git push
▼
┌──────────────────────────────────────────────────────────┐
│ VM Ubuntu (192.168.211.129) │
│ ├── Docker Compose │
│ │ └── Flask + PostgreSQL + Adminer + Nginx + HTTPS │
│ ├── minikube (K8s-кластер) │
│ │ ├── Flask + PostgreSQL + Adminer + Ingress │
│ │ ├── Prometheus + Grafana + Alertmanager │
│ │ └── HPA (автомасштабирование) │
│ └── Terraform + Ansible (провижининг + конфигурация) │
└──────────────────────────────────────────────────────────┘
```
## 📬 Контакты

- GitHub: [@chernyistas](https://github.com/chernyistas)
