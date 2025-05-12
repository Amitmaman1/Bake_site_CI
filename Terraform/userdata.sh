#!/bin/bash
sudo dnf install docker -y
sudo systemctl enable --now docker
sudo usermod -aG docker ec2-user
sudo docker pull amitmaman1/my-image:latest
sudo docker run -d -p 80:5000 amitmaman1/my-image:latest
