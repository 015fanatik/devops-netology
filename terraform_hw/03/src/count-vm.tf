



resource "yandex_compute_instance" "web" {
count = 2
name = "web-${count.index+1}"
resources {
    cores = 2
    memory = 2
    core_fraction = 100
}
  boot_disk {
    initialize_params {
       image_id = var.image
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
}





