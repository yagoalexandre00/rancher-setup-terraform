#!/bin/bash
docker run --privileged -d --restart=unless-stopped -p 80:80 -p 443:443 --name rancher rancher/rancher