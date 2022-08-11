#!/bin/bash

echo -e "\e[1;33m[=] This Script will setup the config!! [=]";

# Fucntion start here
inLvim(){
  [ -d "$HOME/.config/lvim" ] && mv $HOME/.config/lvim $HOME/.config/lvim.bak
  stow Lunarvim && echo -e "\e[1;32m[+] Success" || echo -e "\e[1;31m[-]Error"
}

inKonsole(){
  [ ! -d "$HOME/.local/share/konsole/" ] && mkdir -p $HOME/.local/share/konsole/
  stow Konsole && echo -e "\e[1;32m[+] Success" || echo -e "\e[1;31m[-]Error"
}

inTerminal(){
  [ -f "$HOME/.config/starship.toml" ] && mv $HOME/.config/starship.toml $HOME/.config/starship.toml.bak
  stow ShellCustom && echo -e "\e[1;32m[+] Success" || echo -e "\e[1;31m[-]Error"
}

inExtra(){
  if [[ -d "$HOME/Personal" ]];then
    while true;do
      read -p "Personal Folder already Existed. Want to merge?" yn
      case $yn in 
        [Yy]* ) stow PersonalConfig; break;;
        [Nn]* ) echo -e "\e[32m Skipping..."; break;;
        * ) echo "Please select Yy||Nn"; break;; 
      esac
    done
  else
    stow PersonalConfig && echo -e "\e[1;32m[+] Success" || echo -e "\e[1;31m[-]Error"
  fi
}
#Function Ends.

# Options Starts here.

while true;do
  echo -e "\e[0m"
  read -p "Do you wish to install Lvim Configs >> " yn
  case $yn in
    [Yy]* ) inLvim; break;;
    [Nn]* ) echo -e "\e[32m Skipping..."; break;;
    * ) echo "Select Yes | No";;
  esac
done

while true;do
  echo -e "\e[0m"
  read -p "Do you wish to install Konsole Colorscheme >> " yn
  case $yn in
    [Yy]* ) inKonsole; break;;
    [Nn]* ) echo -e "\e[32m Skipping..."; break;;
    * ) echo "Select Yes | No";;
  esac
done

while true;do
  echo -e "\e[0m"
  read -p "Do you wish extra Terminal Prompt >> " yn
  case $yn in
    [Yy]* ) inTerminal; break;;
    [Nn]* ) echo -e "\e[32m Skipping..."; break;;
    * ) echo "Select Yes | No";;
  esac
done

while true;do
  echo -e "\e[0m"
  read -p "Do you wish to install Extra Stuff >> " yn
  case $yn in
    [Yy]* ) inExtra; break;;
    [Nn]* ) echo -e "\e[32m Skipping..."; break;;
    * ) echo "Select Yes | No";;
  esac
done


echo -e "\e[1;32m[=] Setup Done, Enjoy!! [=]";
echo -e "\e[1;34m>> Corrupter-rot @ github.com <<";
