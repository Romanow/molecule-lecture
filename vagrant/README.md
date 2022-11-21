# Vagrant VMs

Create 3 VMs with an IPs:

* postgres-master `192.168.56.100`
* postgres-slave `192.168.56.101`
* pgpool `192.168.56.102`

Based on [vagrant image](https://app.vagrantup.com/romanow/boxes/ansible-box) (Ubuntu 22.04).

```shell
$ vagrant up

$ sudo tee -a /etc/hosts > /dev/null <<EOT
192.168.56.100    postgres-master.local
192.168.56.101    postgres-slave.local
192.168.56.102    pgpool.local
EOT

$ ssh ansible@master

$ vagrant destory -f
```