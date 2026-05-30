### Hexlet tests and linter status:
[![Actions Status](https://github.com/EmelianovaNatalia/devops-for-developers-project-76/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/EmelianovaNatalia/devops-for-developers-project-76/actions)

# DevOps Infrastructure Project

Проект разворачивает инфраструктуру с двумя серверами, балансировщиком и БД.

## Инфраструктура
- vm1 (192.168.252.2) — App сервер 1 с Docker
- vm2 (192.168.252.3) — App сервер 2 с Docker  
- vm3 (192.168.252.4) — HAProxy балансировщик + PostgreSQL

## Требования
- Ansible
- ansible-galaxy роли (см. requirements.yml)

## Установка зависимостей
```bash
make install
```

## Подготовка серверов
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
```

## Приложение
Redmine доступен по адресу: http://192.168.252.4