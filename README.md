# DevOps Practice — 30 Days Linux for DevOps

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
├── app/                       # Flask-приложение
│   ├── app.py                 # Код приложения + метрики
│   ├── requirements.txt       # Зависимости
│   └── Dockerfile             # Сборка образа
├── k8s/                       # Манифесты Kubernetes
│   ├── postgres.yaml          # PostgreSQL (StatefulSet + Service + Secret)
│   ├── flask-app.yaml         # Flask (Deployment + Service)
│   ├── adminer.yaml           # Adminer (Deployment + Service)
│   ├── ingress-flask.yaml     # Ingress для Flask
│   ├── ingress-adminer.yaml   # Ingress для Adminer (с rewrite)
│   └── monitoring-install.md  # Инструкция по установке мониторинга
├── prometheus/                # Конфиги Prometheus
│   ├── prometheus.yml         # Сбор метрик
│   └── alerts.yml             # Правила алертов
├── alertmanager/              # Конфиг Alertmanager (Telegram)
├── scripts/                   # Bash-скрипты
├── notes/                     # Заметки по дням
├── docker-compose.yml         # Docker Compose стек
└── README.md                  # Этот файл
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
- [ ] День 15: ...

---

## 📬 Контакты

- GitHub: [@chernyistas](https://github.com/chernyistas)
