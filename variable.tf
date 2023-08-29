#String Type
/* variable "instance_type" {
   description = "Instance type t2.micro"                   #Meaning full describtion
   type        = string                                     #Ex: string, number, bool, list, set, map
   default     = "t2.micro"                                 #variable default value
}  */

/* #Number Type
variable "instance_count" {
   description = "EC2 Instance count"                       #Meaning full describtion
   type        =  number                                    #Ex: string, number, bool, list, set, map
   default     =  3                                         #variable default value
}  */

/* #Boolean Type                                               #The bool variable can be used to set true or false values inside your terraform file. Showing public ip
variable "enable_public_ip" {
  description = "Enable public IP address"
  type        = bool
  default     = true
} */

/* #List Type
variable "user_names" {
  description = "IAM usernames"
  type        = list(string)                                   #Decribe which type of string to list (number or boolean)
  default     = ["user1", "user2", "user3s"]
} */

/* #Map Type
variable "project_environment" {
  description = "project name and environment"
  type        = map(string)                                    #Do mention what type of variable
  default     = {
    project     = "project-alpha",
    environment = "dev"
  }
} */