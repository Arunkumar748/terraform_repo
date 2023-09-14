 variable "instance_type" {
  description = "Type of EC2 instance"
  type        = string
}
# For the "dev" workspace
variable "workspace" {
  default = "dev"
}

# For for the "test" workspace
variable "workspace" {
  default = "test"
}
