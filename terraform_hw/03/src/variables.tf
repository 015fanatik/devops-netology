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


variable "image" {
  type        = string
  default     = "fd8clogg1kull9084s9o"
  description = "Ubuntu image id"
}











# variables ssh 

variable "ssh-key" {
 type = map(string)
 default = {
 key = "ubuntu:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAmHkgchb0/TZXuXMl2y18SxbFULIDdIneX/TB1trbNv"
 port = "1"
 }
}




# locals



variable "hosts" {
  type = list(object({
 name=string,
 cpu=number,
 ram=number, 
 disk=number 
}))

  default = [
    { name="main", cpu=2, ram=4, disk=15 },
    { name="replica", cpu=4, ram=8, disk=10 },
  ]
 }
