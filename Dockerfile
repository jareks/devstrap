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
ADD devstrap-basic.yml /usr/local/ansible-playbooks/devstrap-basic.yml

RUN useradd -p '$6$F9fHsS6Nui9Fg4$8MczolJcaJEjpDtOgoH.QEnZC0.n4t8UeS9trPt6Vve754ESdlMRstGhGL6Z610TAqZLCmoR59UP1M0ruG4vk0' -m -G sudo -u 1000 -d /home/dev dev
ENV HOME /home/dev
USER dev

# run ansible using wrapper
# -c local is essential, as this docker container does not have ssh!
RUN ansible-playbook /usr/local/ansible-playbooks/devstrap-basic.yml -c local
