#!/bin/bash

mkvirtualenv ansible
pip install ansible

# Install the galaxy roles we are going to use
ansible-galaxy install  --roles-path roles -r requirements.yml

if [ $OS == 'Linux' ]; then
  ansible-playbook -i localhost linux.yml --ask-become-pass

elif [ $OS == 'Darwin' ]; then
  ansible-playbook -i localhost osx.yml --ask-become-pass
fi