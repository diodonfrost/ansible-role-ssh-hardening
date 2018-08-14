# Role Name

[![Build Status](https://travis-ci.org/diodonfrost/ansible-role-ssh-hardening.svg?branch=master)](https://travis-ci.org/diodonfrost/ansible-role-ssh-hardening)

This role provide a compliance for secure openssh-server and openssh-client on your target host.

## Requirements

This role was developed using Ansible 2.4 Backwards compatibility is not guaranteed.
Use `ansible-galaxy install diodonfrost.ssh_hardening` to install the role on your system.

Supported platforms:

```yaml
- name: EL
  versions:
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
```

## Role Variables

This role has multiple variables. The defaults for all these variables are the following:

```yaml
# Define listening sshd port
sshd_port: "22"

# Use only ssh protocol version 2
sshd_protocol_version: "2"

# Listening on specific address
sshd_listening_address: "0.0.0.0"

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

BSD

## Resources

Openssh release note: [https://www.openssh.com/releasenotes.html](https://www.openssh.com/releasenotes.html)

## Author Information

This role was created in 2018 by diodonfrost.
