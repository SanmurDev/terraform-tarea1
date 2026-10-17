terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.4"
    }
  }
}

# Un recurso siempre tiene 2 etiquetas
# 1. TIPO -> Local_file
# 2. NOMBRE -> "hola_terraform"

resource "local_file" "hola_terraform" {
    content = "Hola desde Terraform en Edutek LATHAM!"
    filename = "${path.module}/output/hola.txt"
}

# Segundo archivo con variables
resource "local_file" "config" {
  content = "ambiente=dev\nversion=1.0"
  filename = "${path.module}/output/config.env"
}

# Archivo ejecutable con permisos
resource "local_file" "script" {
  content = "#!bin/bash\necho Terraform!"
  filename = "${path.module}/output/run.sh"
  file_permission = "0755"
}
