Collection of ansible scripts to quickly configure (ubuntu) machines

Default dev user password for docker:
changeme

To generate password hash use:
mkpasswd -m sha-512 your_password

Next, put hash in Dockerfile (useradd line), as well as unencrypted one in ansible-playbooks/devstrap-basic.yml (ansible_sudo_pass)


