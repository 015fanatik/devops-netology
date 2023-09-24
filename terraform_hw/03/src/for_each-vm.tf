


resource "yandex_compute_instance" "virtual" {
  for_each = {for vm in var.hosts : vm.name => vm}
   name = "${each.value.name}"



 resources {
  cores = "${each.value.cpu}"
  memory = "${each.value.ram}"
  core_fraction = 100
}

 boot_disk {
 initialize_params {
 image_id = var.image
 size = "${each.value.disk}"
  }
 }



scheduling_policy {
    preemptible = true
}
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
    security_group_ids = [yandex_vpc_security_group.example.id]
 }

depends_on = [yandex_compute_instance.web]


metadata = {
    serial-port-enable = var.ssh-key.port
    ssh-keys = "${"ubuntu"}:${file("/root/.ssh/id_rsa.pub")}"
 }

}