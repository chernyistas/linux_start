# Ansible Practice

Учебный проект: управление конфигурациями через Ansible.

## Структура
```
ansible/
├── inventory.ini # Список хостов
├── ansible.cfg # Настройки Ansible
├── install-docker.yml # Playbook: установка Docker
├── setup-app.yml # Playbook: настройка приложения
└── templates/
    └── index.html.j2 # Jinja2-шаблон для HTML
```

## Playbooks

### `install-docker.yml`

Устанавливает Docker:
- Обновляет apt cache
- Устанавливает зависимости
- Создаёт `/etc/apt/keyrings`
- Скачивает GPG-ключ Docker
- Добавляет репозиторий с `signed-by`
- Запускает Docker
- Добавляет пользователя в группу `docker`

**Запуск:**
`ansible-playbook install-docker.yml -K`

### 'setup-app.yml'

Настраивает приложение:

- Создаёт пользователя appuser
- Создаёт директорию /opt/my-app
- Генерирует index.html из Jinja2-шаблона
- Запускает nginx-контейнер
- Проверяет через HTTP (uri) и assert

**Запуск:**
`ansible-playbook setup-app.yml -K`

**Проверка**
`curl http://localhost:8080`
Должно вернуть HTML с `Hello from my-app!`.

## Что изучил
- Inventory, playbook, tasks, modules
- Идемпотентность (повторный запуск → changed=0)
- Variables, facts (ansible_*)
- Handlers (notify + handlers)
- Templates (Jinja2)
- register + debug + assert
- Отладка: NO_PUBKEY, Conflicting values, undefined variables
# test
