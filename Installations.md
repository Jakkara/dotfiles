# Installations

## Basic setup

```
# Common requirements
sudo apt install apt-transport-https gnome-tweaks tilix git tmux fonts-powerline zsh

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Change default terminal
sudo update-alternatives --config x-terminal-emulator 

# Neovim
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt update
sudo apt install neovim

# Fetch dotfiles
cd ~
git clone https://github.com/Jakkara/dotfiles.git

```

## Node, NVM, etc.

```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
nvm install node
```

## Terminal

```
# Fix Tilix compat issue
sudo ln -s /etc/profile.d/vte-2.91.sh /etc/profile.d/vte.sh

# Fuzzy finder
sudo apt install fzf

# Create some folder to contain plugin files. ~/Applications used here
mkdir ~/Applications
cd ~/Applications

# ZSH prompt
git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

# bashmarks
git clone https://github.com/huyng/bashmarks.git
cd bashmarks
make install

# syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

## Vim
```
# Linking vimrc and neovim: add to .config/nvim/init.vim
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc

# vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

ln -s /home/jali/dotfiles/.vimrc /home/jali/.vimrc

# in Vim:
PlugInstall
```

## Symlink dotfiles

```
ln -s /home/jali/dotfiles/.tmux.conf /home/jali/.tmux.conf
ln -s /home/jali/dotfiles/.zshrc /home/jali/.zshrc
ln -s /home/jali/dotfiles/.alias /home/jali/.alias
```

## Docker
```
sudo apt-get install \\n    ca-certificates \\n    curl \\n    gnupg \\n    lsb-release\n
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg\n
echo \\n  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \\n  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null\n
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io
```

## Pipewire
```
# Taken from https://askubuntu.com/questions/1339765/replacing-pulseaudio-with-pipewire-in-ubuntu-20-04
sudo add-apt-repository ppa:pipewire-debian/pipewire-upstream
sudo apt update
sudo apt install pipewire libspa-0.2-bluetooth
sudo apt install pipewire-audio-client-libraries
systemctl --user daemon-reload
systemctl --user --now disable pulseaudio.service pulseaudio.socket
systemctl --user mask pulseaudio
systemctl --user --now enable pipewire pipewire-pulse
pactl info
```
