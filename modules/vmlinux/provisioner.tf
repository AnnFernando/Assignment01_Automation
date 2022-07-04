resource "null_resource" "linux_provisioner" {
  count = var.nb_count
  depends_on = [
    azurerm_linux_virtual_machine.linux_vm
  ]

  provisioner "remote-exec" {
    inline = [
      "/usr/bin/hostname"
    ]
    connection {
      type        = "ssh"
      user        = var.adminuser
      password    = var.adminpwd
      private_key = file(var.priv_key)
      host        = element(azurerm_public_ip.public_ip[*].fqdn, count.index + 1)
    }
  }
}