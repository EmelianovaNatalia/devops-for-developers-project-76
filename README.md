### Hexlet tests and linter status:
[![Actions Status](https://github.com/EmelianovaNatalia/devops-for-developers-project-76/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/EmelianovaNatalia/devops-for-developers-project-76/actions)

# DevOps Infrastructure Project

## Ссылка на приложение
http://192.168.252.4

## Требования
- Ansible >= 2.12
- Python >= 3.8
- Доступ по SSH к серверам

## Установка зависимостей
```bash
make install
```

## Подготовка серверов (установка Docker, pip)
```bash
make prepare
```

## Деплой приложения
```bash
make deploy
```

## Работа с секретами
```bash
# Зашифровать vault
make encrypt-vault

# Редактировать vault
make edit-vault

# Расшифровать vault
make decrypt-vault
```

## Переменные
Все переменные описаны в `group_vars/webservers/vars.yml`.
Секреты хранятся в зашифрованном файле `group_vars/webservers/vault.yml`.