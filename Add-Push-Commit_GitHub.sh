#!/usr/bin/env bash

#Note to Self: This is how you make an array with ENV variables
export GITS=('git add .'
             'git push'
            )
# Dont jusdge me, this is all I know how to do!
export dontjudge="\""
export "LINE======================================================================================="

echo -e "Would you like to have an alias for MochiBot-Git? (y/N)"
read -r USERINPUT

if [[ $USERINPUT != "y" ]]; then

    echo "alias mochi=\"/bin/bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/mochimosh101/Random-Scripts/main/Add-Push-Commit_GitHub.sh)\"" >> "$HOME"/.bashrc
    alias mochi="/bin/bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/mochimosh101/Random-Scripts/main/Add-Push-Commit_GitHub.sh)\""

fi



echo -e "What would you like to start with?"
echo -e "   ==============================================================
a. | Would you like me to use Git Add, Git Commit, and Push?    |
b. | Would you like to use Git Add?                             |
c. | Would you like to use Git Commit?                          |
d. | Would you like to use Git Push?                            |
   ==============================================================\n"
read -r ANSWER

if [[ "$ANSWER" == "a" ]]; then

    echo -e "What would you like to put in the commit message?"
    read -r COMMITMESSAGE
    echo
    ${GITS[0]}
    sleep 1
    git commit -m "$dontjudge""$COMMITMESSAGE""$dontjudge"
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
else

    echo "EERRROOORRRRRRRR"
    sleep 1
    echo -e "You have selected something that I have not been program to do!"
    sleep 1
    echo -e "Plrease try again and select another option..."
    exit 1

fi