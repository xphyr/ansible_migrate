FROM fedora:40

ENV pip_packages "ansible requests pyvmomi"

RUN dnf -y update && dnf clean all

RUN dnf -y install python3-pip \
      sudo \
      which \
      python3-dnf \ 
      qemu-img \
    && dnf clean all

RUN pip3 install $pip_packages

RUN ansible-galaxy collection install community.vmware kubernetes.core community.general

RUN mkdir -p /ansible/playbooks/inventory /ansible/playbooks/tasks /ansible/playbooks/resources /ansible/playbooks/templates

COPY inventory /ansible/playbooks/inventory
COPY tasks /ansible/playbooks/tasks
COPY vmware_migrate.yaml /ansible/playbooks
COPY templates /ansible/playbooks/templates

WORKDIR /ansible/playbooks
