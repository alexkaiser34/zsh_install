#! /bin/bash

zsh_setup(){
    sudo apt install zsh
    sudo chsh -s /bin/zsh root
    sudo chsh -s /bin/zsh $USER
}

copy_configs(){
    sudo cp p10k.zsh ~/.p10k.zsh
    sudo cp zshrc ~/.zshrc
    sudo cp -r ohmyzsh ~/.oh-my-zsh
}

install_font(){
    cd nerd-fonts
    ./install.sh Hack
    cd ..
}

echo_instructions(){
    echo "Please restart VM!"
    echo "Change terminal font to Hack after restart in terminal preferences!"
    echo "In terminal preferences-> colors"
    echo "Built in schemes: Custom"
    echo "Default Color: Text = white, Background = Black"
    echo "Bold Color = Light purple"
    echo "Check use transparency from system theme"
}

if [[ "$USER" == "root" ]]; then
    echo "Error, must not be run this script as root!!"
    exit 1
fi

zsh_setup
copy_configs
install_font
echo_instructions
