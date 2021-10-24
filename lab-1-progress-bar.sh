#!/bin/bash
: <<'END'
# Comment Block Info - Start
# single quotes, ', around the END dilimtier are preventing the block being parsed and executed. It's very important.
# https://stackoverflow.com/questißons/947897/block-comments-in-a-shell-script
# Comment Block Info - End

Examples of progress bar:
1. https://github.com/fearside/ProgressBar/blob/master/progressbar.sh 
2. https://stackoverflow.com/questions/947897/block-comments-in-a-shell-script

END

echo -ne '#####                     (33%)\r'
sleep 1
echo -ne '#############             (66%)\r'
sleep 1
echo -ne '#######################   (100%)\r'
echo -ne '\n'
: This is a comment

: <<'END'
# Ref. https://stackoverflow.com/questions/238073/how-to-add-a-progress-bar-to-a-shell-script/3330834
# Bar spinner, version-1: OK
# i=1
# sp="/-\|"
# echo -n ' '
# while true
# do
#     printf "\b${sp:((i++))%${#sp}:1}"
#     echo $i
# done

# Bar spinner, version-2(POSIX): OK
# sp='/-\|'
# printf ' '
# while true; do
#     printf '\b%.1s' "$sp"
#     sp=${sp#?}${sp%???}
# done

###########################################
# installOf="Installing OpenCv  "
# 
# function printProgressBar() {
#     local progressBar="."
#     printf "%s" "${progressBar}"
# }

# printf "%s" "${installOf}"
# 
# while (( cnt < 20))
# do
#     ((cnt++))
#     printProgressBar 
#     sleep 1
# done


########################################### Can't exit from loop
# # You can determine the status of your installation as your script demands
# 
# installStatus="Success"
# printf " [%s]\n" "${installStatus}"

# function InstEssent()
# {
#     # sudo apt-get -y install build-essential
#     # sleep 5
#     echo "Progress Testing"
#     sleep 15
# }
# 
# printf "%s" "${installOf}"
# 
# InstEssent  &
# pid_InstEssent="$!"
# 
# while kill -0 "$pid" 2> /dev/null
# do
#     echo $pid
#     printProgressBar 
#     sleep 1
# done
# exit 0

END