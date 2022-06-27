    resource "docker_image" "alpine" {
        name = "alpine:3.16.0"
    }
    resource "docker_image" "nginx" {
        name = "nginx:1.22.0"
    }
    # resource "docker_container" "nginx" {
    #     name  = "my_nginx"
    #     image = docker_image.nginx.latest
    #     ## step 2
    #     ports {
    #         external = 8080
    #         internal = 80
    #         ip       = "0.0.0.0"
    #         protocol = "tcp"
    #     }
    #     ## step 3
    #     # volumes {
    #     #     host_path      = "${path.cwd}/html"
    #     #     container_path = "/usr/share/nginx/html"
    #     # }
    # }
    terraform {
    required_providers {
        docker = {
        source  = "kreuzwerker/docker"
        version = "2.17.0"
        }
    }
    }

    provider "docker" {
        # host = "unix:///var/run/docker.sock"
    }
