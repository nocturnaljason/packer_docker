packer {
  required_plugins {
    docker = {
      version = ">= 0.0.7"
      source = "github.com/hashicorp/docker"
    }
  }
}

source "docker" "ubuntu" {
  image = "ubuntu:xenial"
  commit = true
}

build {
  name = "docker-packer"
  sources = [
    "source.docker.ubuntu"
  ]

  provisioner "shell" {
    environment_vars = [
    "CREATOR=Jason Miller",
    ]

    inline = [
      "echo Adding file to Docker Container",
      "echo \"CREATOR is $CREATOR\" > example.txt",
    ]
  }
}

