resource "exoscale_security_group" "autoscaling" {
  name = "autoscaling"
  description = "Managed by Terraform!"
}

resource "exoscale_security_group_rule" "http" {
  security_group_id = exoscale_security_group.autoscaling.id
  type = "INGRESS"
  cidr = "0.0.0.0/0"
  start_port = "8080"
  end_port = "8080"
  protocol = "TCP"
  description = "Managed by Terraform!"
}

resource "exoscale_security_group_rule" "ssh" {
  security_group_id = exoscale_security_group.autoscaling.id
  type = "INGRESS"
  cidr = var.admin_ip
  start_port = "22"
  end_port = "22"
  protocol = "TCP"
  description = "Managed by Terraform!"
  count = var.admin_ip==""?0:1
}
