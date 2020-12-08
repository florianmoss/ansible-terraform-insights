### The Ansible inventory file
resource "local_file" "AnsibleInventory" {
 content = templatefile("inventory.tmpl",
 {
  tower-dns = aws_eip.ip-insights-tower.public_dns,
  tower-ip = aws_eip.ip-insights-tower.public_ip,
  tower-id = aws_instance.tower_instance.id,
  machine1-dns = aws_eip.ip-insights-instance1.public_dns,
  machine1-ip = aws_eip.ip-insights-instance1.public_ip,
  machine1-id = aws_instance.machine1_instance.id,
  machine2-dns = aws_eip.ip-insights-instance2.public_dns,
  machine2-ip = aws_eip.ip-insights-instance2.public_ip,
  machine2-id = aws_instance.machine2_instance.id,
  machine3-dns = aws_eip.ip-insights-instance3.public_dns,
  machine3-ip = aws_eip.ip-insights-instance3.public_ip,
  machine3-id = aws_instance.machine3_instance.id,
 }
 )
 filename = "inventory"
}