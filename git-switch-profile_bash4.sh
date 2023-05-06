#!/bin/bash

# bash version >4
# https://itnext.io/upgrading-bash-on-macos-7138bd1066ba

# With the help of chatGPT

# Define an array of Git profiles
profiles=("work" "sudonitin")

# declare profiles
declare -A workProfile
workProfile["userName"] = "work"
workProfile["email"] = "work@example.com"

declare -A sudonitinProfile
sudonitinProfile["userName"] = "sudonitin"
sudonitinProfile["email"] = "temp@gmail.com"

declare -A profileMap
profileMap["work"] = workProfile
profileMap["sudonitin"] = sudonitinProfile

# Prompt the user to select a profile
echo "Select a Git profile:"
select profile in "${profiles[@]}"
do
    # Check if the selected profile is valid
    if [[ " ${profiles[@]} " =~ " ${profile} " ]]; then
        # Set the Git config values for the selected profile
        git config --global user.name $profileMap[$profile]["userName"]
        git config --global user.email $profileMap[$profile]["email"]
        # Add any additional config values you need for this profile
        
        # Output the selected profile
        echo "Switched to Git profile: ${profile}"
        break
    else
        echo "Invalid profile. Please select a valid profile."
    fi
done

# Follow the steps below to make this script run anywhere from the terminal

`:<<'EOF'`
1. Copy the path of this script
2. Add this directory to your $PATH variable by editing your shell's configuration file (e.g. ~/.bashrc or ~/.zshrc)
   and adding the following line at the end:

    export PATH="$PATH:/path/to/script"

3. Reload your shell's configuration file by running:
    source ~/.bashrc   # for Bash
    source ~/.zshrc    # for Zsh
EOF