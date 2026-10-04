# ============================================================
# outputs.tf — что показать после terraform apply
# ============================================================
output "container_name" {
  description = "Имя созданного контейнера"
  value       = docker_container.vm.name
}

output "container_ip" {
  description = "IP-адрес контейнера"
  value       = docker_container.vm.network_data[0].ip_address
}

output "ssh_command" {
  description = "команда для подключения по SSH"
  value       = "ssh -o StrictHostKeyChecking=no -p ${var.ssh_port} root@localhost"
}

output "ansible_inventory" {
  description = "Путь к inventory для Ansible"
  value       = local_file.ansible_inventory.filename
}

output "run_ansible_hint" {
  description = "Как запустить Ansible"
  value       = "ansible-playbook -i ${var.ansible_inventory_path} playbook.yml"
}  
