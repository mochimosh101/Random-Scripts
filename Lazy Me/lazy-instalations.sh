#!/usr/bin/env bash


export "USERHOME=$(echo -e "$HOME")"
export "CURRENTUSER"="$(echo -e "$USER")"
export "LINE==========================================================="
readonly LINE

export "SHELL=/bin/bash"


################
################


sudo apt-get update; sudo apt upgrade -y
echo -e "\n$LINE\nNote: Defualt shell will be /bin/bash\n$LINE\n"
sudo echo

# Could add new shell to the user #
echo -e "Would you like to add a custom shell? [y/N]"
read -r CUSTOM_SHELL_ANSWER

if [[ $CUSTOM_SHELL_ANSWER == "y" ]]; then

    echo -e "\nShell for the user:"
    read -r SHELL

    echo -e "\n$LINE\nThe Shell will be: $SHELL\n$LINE\n"

fi

# Create usernmae #
echo -e "Would you like to create a user? [Y/n]"
read -r CREATE_USERNAME_ANSWER

if [[ $CREATE_USERNAME_ANSWER != "n" ]]; then
   
    echo -e "Please enter the username:"
    read -r CUSTOM_USERNAME
    echo -e "\n$LINE\nThe User Name will be: $CUSTOM_USERNAME\n$LINE\n"

    # Add user discription #
    echo -e "Would you like to add a discription to this user? [Y/n]"
    read -r DISCRIPTION_ANSWER

    if [[ $DISCRIPTION_ANSWER != "n" ]]; then
        echo -e "\nDiscription for user:"
        read -r USER_DISCRIPTION
        echo -e "\n$LINE\nThe User Name will be: $USER_DISCRIPTION\n$LINE\n"
        
    elif [[ $DISCRIPTION_ANSWER == "n" ]]; then
        $USER_DISCRIPTION -eq "" || $USER_DISCRIPTION -eq " "
    fi

    sudo useradd -m -s "$SHELL" -c "\"$USER_DISCRIPTION\"" "$CUSTOM_USERNAME"

    echo -e "\n$LINE\nAccording to your inputs these are the results:
    Username: $CUSTOM_USERNAME
    User shell: $SHELL
    User discription: $USER_DISCRIPTION\n$LINE\n"

fi

# Add or create password for the user #
echo -e "Would you like to set $CUSTOM_USERNAME's password? [Y/n]"
read -r PASSWORD_ANSWER

if [[ $PASSWORD_ANSWER != "n" ]]; then

    sudo passwd "$CUSTOM_USERNAME"
    echo -e "\n$LINE\nYou have successfully set $CUSTOM_USERNAME's password\n$LINE\n"

fi

# Add user to a group #
echo -e "\nWould you like to add $CUSTOM_USERNAME to a group? [Y/n]"
read -r GROUP_ANSWER

if [[ $GROUP_ANSWER != "n" ]]; then

    echo -e "Which group would you like to add $CUSTOM_USERNAME to:"
    read -r CUSTOM_GROUP

    sudo usermod -aG "$CUSTOM_GROUP" "$CUSTOM_USERNAME"
    sleep 1

    echo -e "\n$LINE\nYou have successfully added $CUSTOM_USERNAME to $CUSTOM_GROUP.
    Username: $CUSTOM_USERNAME
    User shell: $SHELL
    User discription: $USER_DISCRIPTION
    User Group: $CUSTOM_GROUP\n$LINE\n"

fi

#### GO TO THE USER HOME DIRECTORY ####
echo -e "\nWould you like to go to $CUSTOM_USERNAME's Home Directory? [Y/n]"
read -r HOME_DIRECROTY_ANSWER

if [[ $HOME_DIRECROTY_ANSWER != "n" ]]; then

    su -c "$CUSTOM_USERNAME"
    cd "$HOME" || echo -e "Sorry I failed you master!"; exit 1 
    echo -e "\n$LINE\nYou have successfully gone to $CUSTOM_USERNAME's Home Directory.\n$LINE\n"
    exit

fi


#### Doing SSH ####
mkdir "$USERHOME"/.ssh
chmod 0700 "$USERHOME"/.ssh
echo "Making your .ssh folder..."
sleep 2
echo -e "MochiBot has successfully created .ssh folder into your home directory!"
sleep 1
echo "$LINE"
ls -al "$USERHOME"
echo "$LINE"

echo -e "MochiBot is transfering you to your .ssh folder...\n"
cd "$HOME"/.ssh || return
echo -e "\nMochiBot has successfully transfered you to your .ssh folder!"

echo -e "Do you want your SSH key in a file called authorized_keys? [Y/n]"
read -r AUTHORIZED_KEYS_ANSWER

if [[ $AUTHORIZED_KEYS_ANSWER != "n" ]]; then

    touch authorized_keys
    chmod 0700 authorized_keys
    echo "Making your authorized_keys file..."
    sleep 2
    echo -e "MochiBot has successfully created authorized_keys file into your .ssh directory!"
    sleep 1
    echo "$LINE"
    ls -al "$USERHOME/.ssh"
    echo "$LINE"
    sleep 1
    echo -e "Please enter your SSH Public key:"
    read -r SSH_KEY
    echo -e "\n$LINE\nYour SSH Public key is: $SSH_KEY\n$LINE\n"
    echo -e "$SSH_KEY" >> authorized_keys
    echo -e "\n$LINE\nYour SSH key has been added to your authorized_keys folder!\n$LINE\n"
    sleep 1
    echo -e "MochiBot is transfering you to your home directory...\n"
    cd "$HOME" || return
    echo -e "\nMochiBot has successfully transfered you to your home directory!"
    sleep 1
    echo -e "Would you like to edit the SSHD config file? [Y/n]"
    read -r SSHD_CONFIG_ANSWER
    if [[ $SSHD_CONFIG_ANSWER != "n" ]]; then
        sudo vim /etc/ssh/sshd_config
        echo -e "\n$LINE\nYou have successfully edited the SSHD config file!\n$LINE\n"
        sleep 1
        echo -e "Would you like to restart the SSHD service? [Y/n]"
        read -r SSH_RESTART_ANSWER
        if [[ $SSH_RESTART_ANSWER != "n" ]]; then
            sudo systemctl restart sshd
            echo -e "\n$LINE\nYou have successfully restarted the SSHD service!\n$LINE\n"
            sleep 1
        sudo service ssh restart
        echo -e "\nMochiBot has successfully restarted the SSH service!\n"
        sleep 1
        echo -e "MochiBot is transfering you to your home directory...\n"
        cd "$HOME" || return
        echo -e "\nMochiBot has successfully transfered you to your home directory!"
        fi
    fi

fi