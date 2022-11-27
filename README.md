# Человек-Molecule или как тестировать инфраструктуру

[![build](https://github.com/Romanow/molecule-lecture/actions/workflows/build.yml/badge.svg?branch=master)](https://github.com/Romanow/molecule-lecture/actions/workflows/build.yml)

## Аннотация

Все знают, что в разработке тесты важны и полезны. Но ведь у нас есть еще инфраструктура, как с ней быть? Там тоже есть
сложные сценарии развертывания и цена ошибки может быть еще выше: ведь неправильная конфигурация окружения может быть
выявлена только в процессе использования. Поговорим про ценность IaaC подхода и про то, как тестировать ansible роли с
помощью Molecule.

## План доклада

1. Что такое IaaC (Infrastructure as a Code), почему важно использовать этот подход.
2. Краткий рассказ про Ansible: что умеет, из чего состоит.
3. Рассмотрим пример развертывания Postgres Master-Slave и PgPool II с помощью Ansible.
4. Что такое Molecule, как его применять.
    1. как писать проверки, модуль `ansible.builtin.assert`;
    2. структура molecule:
        * platforms;
        * provisioner;
        * lint;
        * verifier.
5. Тестируем отдельные роли (roles);
6. Тестируем весь сценарий развертывания (playbooks).

## Пример

### Подготовка

* Локальные VM с использованием [vagrant](vagrant/README.md)
* Cloud VM в [DigitalOcean](terraform/README.md)

[Настройка скриптов Ansible](ansible/README.md)

### Формулировка задачи

### Запуск

## Ссылки

1. [Postgres replication configuration](https://www.postgresql.org/docs/current/runtime-config-replication.html)
2. [How To Set Up Physical Streaming Replication with PostgreSQL 12 on Ubuntu 20.04](https://www.digitalocean.com/community/tutorials/how-to-set-up-physical-streaming-replication-with-postgresql-12-on-ubuntu-20-04)