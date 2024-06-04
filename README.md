# Build

podman build -t ansible_migrate:latest .


# Run

ansible-playbook -i inventory/inventory.yaml vmware_migrate.yaml 