# Ansible scripts to create Postgres Master-Slave cluster with PgPool II

```shell
# создаем virtual environment
$ python3 -m venv ~/.ansible-env/

$ . ~/.ansible-env/bin/activate.fish

$ pip3 install -r requirements.txt

$ echo root > .vault_pass

$ ansible-playbook -i inventories/local/hosts.yml --list-hosts --list-tasks postgres.yml
    
$ ansible-playbook -i inventories/local/hosts.yml --vault-password-file=.vault_pass postgres.yml 
```

Для запуска на DigitalOcean, с нужно помощью Dynamic
Inventory [digital_ocean.py](inventories/digitalocean/digital_ocean.py)
получить список VM, для этого нужен `DO_API_TOKEN`:

```shell
$ export DO_API_TOKEN=<DigitalOcean API token>

$ ansible-playbook -i inventories/digitalocean/digital_ocean.py --vault-password-file=.vault_pass postgres.yml
```

Получить DigitalOcean Access Token: `Control Panel` -> `API` -> `Generate New Token`.

Проверка работоспособности:

```shell
# на postgres-master
$ sudo -u postgres psql
$ psql: SELECT client_addr, state FROM pg_stat_replication;

# на postgres-slave
$ sudo -u postgres psql
$ psql: SELECT now() - pg_last_xact_replay_timestamp();
```