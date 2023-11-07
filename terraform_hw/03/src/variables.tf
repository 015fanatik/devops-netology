###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}

variable "vm_web_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "example"
}

variable "vm_web_platform_id" {
  type        = string
  default     = "standard-v3"
  description = "example"
}

variable "vm_web_resources" {
type = map(string)
default = {vm_cores = "2",vm_memory = "2",vm_core_fraction = "20"}
}

variable "metadata" {
type = map(string)
default = {serial-port-enable = "1",ssh-keys = "ubuntu:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDNh/nXQX6S4PPWRSVMxjwwrBlZf0Sa73tF0ieak9BQX2a6cJV1Dvi9mexxd7OWXEFpa/TU9rK/CUIus/zTkDU1B+FO9rT7MzqSckUOWnrpaatNYLynUFOrnPcOw+13w6Km1Yh1LPnvvt7qOWloI6MNRRUFJ+qM9yztD6CxqsFt4BN2hc18Xz0EFH4dByHXLLqXHALkCmt6GU8inQyd8g9xzpQCQt1bcI8LQe41y8d10lRgUItY/7mcyEGdX4d1l/v1NdwDBiuRyWw65HSuLXqr1xxqMIAnVow7F0QxqsTjzXFEq8Fg9xci9HJClGVSPcG7Ph2DVuTIdjVk8O42HF8TVt8Yc14WEmVmbI+OzeY2csbqOwm47qSv1mVXuEFpPHN440au1aalyqMy9Wj4h6QaqvO6eOeRlnCs01WZYbQlRmt9XGfGriA/T5oK0+P8iiKthKhOpll9VyHQEwTZcRxq76KbdcWEqjPy4eC1uSXCh2wBt1fq0Ebcq4Aclq4ySqE="}
}


#variable "metadata" {
#type = map(string)
#default = {serial-port-enable = "1",ssh-keys = "ubuntu:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIPcXa1t17x3Ri1gCk9/Qn3InHu+hhQWmixT16Eg+RqI"}
#}







variable "virtual" {
    type = list(object({
    vm_name = string
    cpu  = number
    ram  = number
    disk = number
  }))
  default = [
    { vm_name = "main", cpu = 4, ram = 4, disk = 20 },
    { vm_name = "replica", cpu = 2, ram = 2, disk = 10 },
  ]
}

variable "disk_count" {
    type = list
  default = [0,1,2]
}