resource "aws_key_pair" "ssh-key" {
    key_name   = "mykey"
    public_key = "${file("${var.PUBLIC_KEY_PATH}")}"
} 
resource "aws_instance" "vcc" {
    ami           = "${lookup(var.AMIS, var.AWS_REGION)}"
    instance_type = "t2.micro"
    key_name      = "${aws_key_pair.ssh-key.key_name}"

    provisioner "file" {
        source      = "script.sh"
        destination = "/tmp/script.sh"
    }
    provisioner "remote-exec" {
        inline = [
            "chmod +x /tmp/script.sh",
            "sudo /tmp/script.sh"
        ]
    }
        connection  = {
            user    = "${var.INSTANCE_USERNAME}"
            private_key = "${file("${var.PRIVATE_KEY_PATH}")}"
        }
}

resource "aws_instance" "portal" {
    ami            = "${lookup(var.AMIS, var.AWS_REGION)}"
    instance_type  = "t2.micro"
    key_name       = "${aws_key_pair.ssh-key.key_name}"
    provisioner "local-exec" {
        command = "echo ${aws_instance.portal.public_ip} >> public_id.txt"
    }
    provisioner "local-exec" {
        command = "echo ${aws_instance.vcc.public_ip}"
    }
}