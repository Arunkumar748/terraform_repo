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

#Boolean Type                                               #The bool variable can be used to set true or false values inside your terraform file.
variable "enable_public_ip" {
  description = "Enable public IP address"
  type        = bool
  default     = true
}