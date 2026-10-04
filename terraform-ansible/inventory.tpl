# ============================================================
# inventory.tpl — шаблон inventory для Ansible
# ============================================================

[terraform_vms]
${container_name} ansible_host=${ssh_host} ansible_port=${ssh_port} ansible_user=${ssh_user} ansible_ssh_common_args='-o StrictHostKeyChecking=no'
