#!/bin/bash
sudo pacman -S ruby base-devel
gem install jekyll bundler
bundle add webrick
echo 'export GEM_HOME="$HOME/gems"' >> ~/.bashrc
echo 'export PATH="$HOME/.local/share/gem/ruby/3.0.0/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc