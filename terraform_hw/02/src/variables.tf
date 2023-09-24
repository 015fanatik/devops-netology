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
  description = "VPC network & subnet name"
}

variable "vm_web_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "image name"
}


# variables name

variable "name1" {
  type        = string
  default     = "netology"
}

variable "name2" {
  type        = string
  default     = "develop"
}


variable "name3" {
  type        = string
  default     = "platform"
}

variable "name4" {
  type        = string
  default     = "web"
}

variable "name5" {
  type        = string
  default     = "db"
}



# resources variables


variable "vm_web_resources" {
 type = map(string)
 default = {
 vm_web_cores = "2",
 vm_web_memory = "2",
 vm_web_core_fraction = "50"
 }
}

variable "vm_db_resources" {
 type = map(string)
 default = {
 vm_db_cores = "2",
 vm_db_memory = "2",
 vm_db_core_fraction = "20"
 }
}





# variables ssh 

variable "ssh-key" {
 type = map(string)
 default = {
 key = "ubuntu:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAmHkgchb0/TZXuXMl2y18SxbFULIDdIneX/TB1trbNv"
 port = "1"
 }
}






