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
    default = "us-east-1"
}
variable "AMIS"{
    type = "map"
    default = {
        us-east-1 = "ami-3dec9947"
        us-west-2 = "ami-a2e544da"
        eu-west-1 = "ami-63b0341a"
    }
}



