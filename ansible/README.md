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