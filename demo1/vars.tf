variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}
variable "INSTANCE_USERNAME" {
    default = "ubuntu"
}
variable "PRIVATE_KEY_PATH" { 
    default = "~/.ssh/id_rsa"
} 
variable "PUBLIC_KEY_PATH"  { 
    default = "~/.ssh/id_rsa.pub"
} 
variable "AWS_REGION" {
    default = "eu-west-1"
}
variable "AMIS"{
    type = "map"
    default = {
        us-east-1 = "ami-6a2da510"
        us-west-2 = "ami-06b94666"
        eu-west-1 = "ami-0d729a60"
    }
}



