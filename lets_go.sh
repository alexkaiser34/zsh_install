#! /bin/bash

zsh_setup(){
    sudo apt install zsh
    sudo -s
    chsh -s /bin/zsh root
    chsh -s /bin/zsh $USER
}

copy_configs(){
    sudo cp p10k.zsh ~/.p10k.zsh
    sudo cp zshrc ~/.zshrc
    sudo cp -r oh-my-zsh ~/.oh-my-zsh
}

install_font(){
    cd nerd-fonts
    ./install.sh Hack
    cd ..
}

echo_instructions(){
    echo "Please restart VM!"
    echo "Change terminal font to Hack after restart!"
}

if [[ "$USER" != "root" ]]; then
    echo "Error, must run this script as root!!"
    exit 1
fi

zsh_setup
copy_configs
install_font
echo_instructions
