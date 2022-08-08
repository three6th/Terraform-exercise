resource "random_pet" "animal" {
    count = 3
}

resource "local_file" "backends" {
    count = 3

    content  = templatefile("backends.tftpl", { ip_addrs = ["0.0.0.0", "8.8.8.8"],  port = 8080 })
    filename = "${path.module}/backend-${random_pet.animal[count.index].id}.conf"
    file_permission = "0640"
}