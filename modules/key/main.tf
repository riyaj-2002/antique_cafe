
resource "aws_key_pair" "kp" {
    key_name   = "key-pair"
    public_key = file("../modules/key/key-pair.pub")

    tags = {
        Name = "${var.project_name}-key-pair"
    }
}

