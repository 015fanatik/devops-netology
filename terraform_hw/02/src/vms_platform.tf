# vm_web

variable "vms_ssh_root_key" {
  type        = string
  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAmHkgchb0/TZXuXMl2y18SxbFULIDdIneX/TB1trbNv"
  description = "ssh-keygen -t ed25519"
}


variable "vm_web_name" {
  type        = string
  default     = "netology-develop-platform-web"
  description = ""
}

variable "vm_web_platform_id" {
  type        = string
  default     = "standard-v3"
  description = ""
}





# vm_db

variable "vm_db_name" {
  type        = string
  default     = "netology-develop-platform-db"
  description = ""
}

variable "vm_db_platform_id" {
  type        = string
  default     = "standard-v3"
  description = ""
}