# ssh-hardening

[![Ansible Galaxy](https://img.shields.io/badge/galaxy-diodonfrost.ssh_hardening-660198.svg)](https://galaxy.ansible.com/diodonfrost/ssh_hardening)
[![Build Status](https://travis-ci.org/diodonfrost/ansible-role-ssh-hardening.svg?branch=master)](https://travis-ci.org/diodonfrost/ansible-role-ssh-hardening)

This role provide a compliance for secure openssh-server and openssh-client on your target host.

## Requirements

This role was developed using Ansible 2.4 Backwards compatibility is not guaranteed.
Use `ansible-galaxy install diodonfrost.ssh_hardening` to install the role on your system.

Supported platforms:

```yaml
- name: EL
  versions:
    - 8
    - 6
    - 7
- name: Fedora
  versions:
    - 28
    - 27
    - 26
- name: Debian
  versions:
    - stretch
    - jessie
    - wheezy
- name: Ubuntu
  versions:
    - bionic
    - artful
    - xenial
    - trusty
    - precise
- name: OracleLinux
  versions:
    - 7
    - 6
- name: Amazon
  versions:
    - all
- name: opensuse
  versions:
    - all
- name: ArchLinux
  versions:
    - any
- name: Gentoo
  versions:
    - any
- name: FreeBSD
  versions:
    - 11.0
    - 10.4
- name: OpenBSD
  versions:
    - 6.0
```

## Role Variables

This role has multiple variables. The defaults for all these variables are the following:

```yaml
---
# defaults file for ansible-role-ssh-hardening

# Enable hardening sshd
sshd_hardening: true

# Enable hardening ssh
ssh_hardening: true

# Enable public keys transfert
openssh_keys: true

# Transfert ssh public on the target host
public_keys: []
# - key1
# - key2
# - key3

### OPENSSH-SERVER ###

# Define listening sshd port
sshd_port: "22"

# Use only ssh protocol version 2
sshd_protocol_version: "2"

# Listening on specific address
sshd_listening_address:
  - 0.0.0.0

# Check host key when sshd start
sshd_host_key_files: []

# Deny root login
sshd_root_login: "no"

# Disable kerberos
sshd_kerberos_support: false

# Disable gssapi authentification
sshd_gssapi_support: false

# Disable x11 forwarding
sshd_x11_forwarding: "no"

# Disable agent forwarding
sshd_agent_forwarding: "no"

# Disable tcp forwarding
sshd_tcp_forwarding: "no"

# Disconnect idle sessions
sshd_client_alive_intervale: "300"
sshd_client_alive_countMax: "2"

# Set banner
sshd_banner: "/etc/issue.net"

# Use pam authentification
sshd_pam: "yes"

# Use  privilege separation
sshd_privilege_separation_59: "sandbox"
sshd_privilege_separation_53: "yes"

# Password authentification should be disable
sshd_password_authentification: "yes"

# Limit max connexion non-authentified concurency and max try
sshd_max_auth_tries: "5"
sshd_max_startups: "10:30:100"

### OPENSSH-CLIENT ###

# Definie default ssh port
ssh_port: "22"

# Disable roaming
ssh_roaming: "no"

# Ssh must be use pub key
ssh_password_authentification: "no"
```

## Dependencies

None

## Example Playbook

This is a sample playbook file for deploying the Ansible Galaxy ssh-hardening role in a localhost and installing the open source version of ssh-hardening.

```yaml
---
- hosts: localhost
  become: true
  roles:
    - role: diodonfrost.ssh_hardening
```


## License

Apache 2

## Resources

Openssh release note: [https://www.openssh.com/releasenotes.html](https://www.openssh.com/releasenotes.html)

## Author Information

This role was created in 2018 by diodonfrost.
