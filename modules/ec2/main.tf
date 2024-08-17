
resource "aws_instance" "computer1" {
  ami           = "ami-005e54dee72cc1d00" # us-west-2
  instance_type = "t2.micro"

  network_interface {
    network_interface_id = var.network_interface_id_1
    device_index         = 0
  }

  credit_specification {
    cpu_credits = "unlimited"
  }
  provisioner "local-exec" {
   command = "echo ${aws_instance.computer1.id} >> instance_id.txt"
  }
}


resource "aws_instance" "computer2" {
  ami           = "ami-005e54dee72cc1d00" # us-west-2
  instance_type = "t2.micro"

  network_interface {
    network_interface_id = var.network_interface_id_2
    device_index         = 0
  }

  credit_specification {
    cpu_credits = "unlimited"
  }
  provisioner "local-exec" {
   command = "echo ${aws_instance.computer2.id} >> instance_id.txt"
  }
}