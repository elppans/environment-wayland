#!/bin/bash

mkdir -p "$HOME"/.config/systemd/user
cp -a environment-wayland.service "$HOME"/.config/systemd/user/
sudo cp environment-wayland /usr/local/bin
sudo chmod +x /usr/local/bin/environment-wayland
systemctl --user enable environment-wayland.service
systemctl --user start environment-wayland.service
