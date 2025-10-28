#!/bin/bash
ssh-add ~/.ssh/github
cd ~/Data/Goon-cave\ Dotfiles/
git add .
git commit -m "Updated"
git push -u origin main
git pull
