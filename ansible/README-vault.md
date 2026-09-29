# Ansible Vault Practice

Шифрование секретов в Ansible.

## Что изучил

- Создание зашифрованных файлов (`ansible-vault create`)
- Редактирование (`edit`), просмотр (`view`)
- Шифрование существующих файлов (`encrypt`), расшифровка (`decrypt`)
- Шифрование строк (`encrypt_string`)
- Использование в playbook (`vars_files`)
- Файл с паролем (`--vault-password-file`)
- Смена пароля (`rekey`)
- Интеграция с CI/CD (GitHub Secrets)

## Пример

```bash
## Создать зашифрованный файл (с nano)
EDITOR=nano ansible-vault create secrets.yml

## Использовать в playbook
ansible-playbook playbook-secrets.yml --ask-vault-pass

# Или с файлом пароля
ansible-playbook playbook-secrets.yml --vault-password-file ~/.vault_pass
```
## Безопасность
- `.vault_pass` — в `.gitignore`

-  Зашифрованные файлы — можно коммитить

- `no_log: true` — для задач с секретами

- В CI/CD — пароль через GitHub Secrets

- Не выводить пароли целиком — только длину, хеш, префикс

## Файлы
- `secrets.yml` — зашифрованные секреты

- `playbook-secrets.yml` — демонстрация использования

- `~/.vault_pass` — пароль (в `.gitignore`)
