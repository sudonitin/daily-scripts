#!/bin/bash

# any bash version

# With the help of chatGPT

# Define an array of Git profiles
profiles=("sudonitin" "work")

# Set the Git username and email for each profile
personal_username="sudonitin"
personal_email="temp@gmail.com"

work_username="work"
work_email="work@work.com"

# Prompt the user to select a profile
echo "Select a Git profile:"
select profile in "${profiles[@]}"
do
    # Check if the selected profile is valid
    if [[ " ${profiles[@]} " =~ " ${profile} " ]]; then
        # Set the Git config values for the selected profile
        if [ "${profile}" = "sudonitin" ]; then
            git config --global user.name "$personal_username"
            git config --global user.email "$personal_email"
            # Add any additional config values you need for this profile
        elif [ "${profile}" = "work" ]; then
            git config --global user.name "$work_username"
            git config --global user.email "$work_email"
            # Add any additional config values you need for this profile
        fi
        
        # Output the selected profile
        echo "Switched to Git profile: ${profile}"
        break
    else
        echo "Invalid profile. Please select a valid profile."
    fi
done

echo $'\n'"Executing git config user.name"
git config user.name

echo $'\n'"Executing git config user.email"
git config user.email


# Follow the steps below to make this script run anywhere from the terminal

:<<'EOF'
1. Copy the path of this script
2. Add this directory to your $PATH variable by editing your shell's configuration file (e.g. ~/.bashrc or ~/.zshrc)
   and adding the following line at the end:

    export PATH="$PATH:/path/to/script"

3. Reload your shell's configuration file by running:
    source ~/.bashrc   # for Bash
    source ~/.zshrc    # for Zsh

4. if you're on mac chip add export PATH="$PATH:/path/to/script" to .bash_profile file
EOF