variable "student_name" {
  description = "The name of the student who's requesting a server"
  type        = string
  nullable    = false
}

variable "server_type" {
  description = "The type of server to launch on Hetzner cloud"
  type        = string
  default     = "cx11"
}

variable "image" {
  description = "The image to use to launch on Hetzner cloud"
  type        = string
  default     = "ubuntu-24.04"
}

variable "location" {
  description = "The location to launch the server in"
  type        = string
  default     = "fsn1"
}

variable "ssh_keys" {
  description = "A list of ssh keys to be uploaded"
  type        = list(string)
  default     = []
}
