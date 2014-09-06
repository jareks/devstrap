FROM ubuntu:14.04
MAINTAINER Jarek Skrzypek

RUN apt-get update

# install ansible
RUN apt-get install -y software-properties-common
RUN apt-add-repository ppa:ansible/ansible
RUN apt-get update
RUN apt-get install -y ansible

# export ansible config
ADD ansible-hosts /etc/ansible/hosts
ADD ansible-playbooks /usr/local/ansible-playbooks

# run ansible using wrapper
# -c local is essential, as this docker container does not have ssh!
#RUN ansible-playbook /usr/local/ansible-playbooks/devtest.yml -c local
