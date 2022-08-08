resource "local_file" "example-file" {
    content  = "some content"
    filename = "${path.module}/example-file.txt"
    file_permission = 0640
}