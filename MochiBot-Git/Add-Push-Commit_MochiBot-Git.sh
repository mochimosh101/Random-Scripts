#!/usr/bin/env bash

#Note to Self: This is how you make an array with ENV variables
export GITS=('git add -A'
             'git push'
             'git pull'
            )

export "LINE======================================================================================="
readonly LINE

export "LINE1====================================="
readonly LINE1

NAME="$(whoami)"
readonly NAME

BOT="\"MochiBot-Git\""
readonly BOT

################
################

clear
printf "\nWelcome, %s\n" "$NAME!"
printf "My name is %s\n" "$BOT"

echo -e "Would you like to have an alias for MochiBot-Git? (y/N)"
read -r ALIASANSWER
if [[ $ALIASANSWER == "y" ]]; then

echo -e "   ====================================================
a. | Temporary Alias                                  |
b. | Permanent Alias For Bash (AKA Linux Bash Right?) |
   ====================================================\n"
echo -e "I currently only support Bash for permanent alias
I Promise I will ask MochiMosh to Update me more!\n"
echo -e "Please enter the option you want:\n"
read -r OPTION

    if [[ $OPTION == "a" ]]; then
        alias mochigit="/bin/bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/mochimosh101/Random-Scripts/main/MochiBot-Git/Add-Push-Commit_MochiBot-Git.sh)\""

    elif [[ $OPTION == "b" ]]; then

        echo "alias mochigit=\"/bin/bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/mochimosh101/Random-Scripts/main/MochiBot-Git/Add-Push-Commit_MochiBot-Git.sh)\"" >> "$HOME"/.bashrc
        alias mochigit="/bin/bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/mochimosh101/Random-Scripts/main/MochiBot-Git/Add-Push-Commit_MochiBot-Git.sh)\""

    fi

fi

echo -e "What would you like to start with?"
echo -e "   ==============================================================
a. | Would you like me to use Git Add, Git Commit, and Push?    |
b. | Would you like to use Git Add?                             |
c. | Would you like to use Git Commit?                          |
d. | Would you like to use Git Push?                            |
x. | Exit Menu                                                  | 
   ==============================================================\n"
read -r ANSWER

if [[ "$ANSWER" == "a" ]]; then

    echo -e "What would you like to put in the commit message?"
    read -r COMMITMESSAGE
    echo
    ${GITS[0]}
    echo -e "\n$LINE1\nMochiBot-Git run ${GITS[0]}\n$LINE1"
    sleep 1
    git commit -m "$COMMITMESSAGE"
    echo -e "\n$LINE1\nMochiBot-Git run ${GITS[1]}\n$LINE1\n"
    sleep 1
    ${GITS[2]}
    echo -e "\n$LINE1\nMochiBot-Git run ${GITS[2]}\n$LINE1\n"
    sleep 1
    ${GITS[1]}
    echo -e "\n$LINE\nMochiBot-Git has has successfully Add Commit Push you Local Repository!\n$LINE\n"

elif [[ $ANSWER == "b" ]]; then
    
    echo -e "Would you like to use Git Add? (Y/n)"
    read -r add
    if [[ $add != "n" ]]; then

        ${GITS[0]}
        echo -e "\n$LINE\nMochiBot-Git has has successfully ran the command Git Add\n$LINE\n"
    
    fi

elif [[ $ANSWER == "c" ]]; then

    echo -e "Would you like to use Git Commit? (Y/n)"
    read -r commit
    if [[ $commit != "n" ]]; then

        echo -e "What would you like to put in the commit message?"
        read -r COMMITMESSAGE
        echo
        echo git commit -m \""$COMMITMESSAGE\""
        echo -e "\n$LINE\nMochiBot-Git has has successfully ran the command Git Commit\n$LINE\n"
    
    fi

elif [[ $ANSWER == "d" ]]; then

    echo -e "Would you like to use Git Push? (Y/n)"
    read -r push
    if [[ $push != "n" ]]; then

        ${GITS[2]}
        echo -e "\n$LINE\nMochiBot has has successfully ran the command Git Push\n$LINE\n"
    
    fi

elif [[ $ANSWER == "x" ]]; then

    echo -e "\nExiting Menu..."
    sleep 1
    exit 0

else

    echo "EERRROOORRRRRRRR"
    sleep 1
    echo -e "You have selected something that I have not been program to do!"
    sleep 1
    echo -e "Plrease try again and select another option..."
    exit 1

fi