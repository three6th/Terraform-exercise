variable "id" {
    type=string
}

resource "random_id" "default" {
    byte_length = 8
}
resource "local_file" "backends" {
    content  = templatefile("backends.tftpl", { ip_addrs = ["0.0.0.0", "8.8.8.8"],  port = 8080 })
    filename = "${path.module}/backend-${random_id.default.hex}.conf"
    file_permission = "0640"
}