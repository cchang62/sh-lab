#!/bin/bash

: <<'END'
numerator=30.2
denominator=100
percentage=0
echo $((numerator*100/denominator))
# echo "$(((numerator/denominator)*100))"

# Read the user input   

# echo "Enter /path/to/vsc/exported/extensions/ext.list"  
# read ext_file  
ext_file="./asset/test-lines.list"

cnt=$(wc -l < $ext_file)
echo $cnt
i=0
echo "Length of Array"
echo ${#extsList[@]}
# myArray=("cat" "dog" "mouse" "frog") # OK
extsList=($(cat  $ext_file |tr "\n" " "))
for extension in ${extsList[@]}; do
    ((i=i+1))
    # echo $i 
    echo $extension
done



function repeatChar() {
    character="+"
    for i in {1..10}
    do 
        echo -n "$character"
    done
}


END

# Got an easy progress bar function that i wrote the other day:
# Ref. https://stackoverflow.com/questions/238073/how-to-add-a-progress-bar-to-a-shell-script/3330834

#!/bin/bash
# 1. Create ProgressBar function
# 1.1 Input is currentState($1) and totalState($2)
function ProgressBar {
# Process data
    _progress=$(( $1*100/$2*100/100 )) #  let _progress= (${1}*100/${2}*100)/100
    # echo $_progress
    # echo $_progress
    _done=$(( ($_progress*4)/10 ))   # let _done=(${_progress}*4)/10
    # echo $_done
    _left=$(( (40-$_done) ))
    # echo $_left
    # let _left=40-$_done
# Build progressbar string lengths
    _fill=$(printf "%${_done}s")
    _empty=$(printf "%${_left}s")

# 1.2 Build progressbar strings and print the ProgressBar line
# 1.2.1 Output example:                           
# 1.2.1.1 Progress : [########################################] 100%
printf "\rProgress : [${_fill// /#}${_empty// /-}] ${_progress}%%"

}

ext_file="./asset/test-lines.list"

cnt=$(wc -l < $ext_file)
# Variables
_start=0
# This accounts as the "totalState" variable for the ProgressBar function
_end=$cnt

# Proof of concept
for number in $(seq ${_start} ${_end})
do
    # sleep 0.1
    sleep 2
    # echo $number
    ProgressBar ${number} ${_end}
    echo -ne  " => ${number} "
done
printf '\nFinished!\n'

: <<'END'
# Ref. https://github.com/edouard-lopez/progress-bar.sh
SLEEP_DURATION=${SLEEP_DURATION:=1}  # default to 1 second, use to speed up tests

progress-bar() {
    local duration
    local columns
    local space_available
    local fit_to_screen  
    local space_reserved

    space_reserved=6   # reserved width for the percentage value
    duration=${1}
    columns=$(tput cols)
    space_available=$(( columns-space_reserved ))

    if (( duration < space_available )); then 
        fit_to_screen=1; 
    else 
        fit_to_screen=$(( duration / space_available )); 
        fit_to_screen=$((fit_to_screen+1)); 
    fi

    already_done() { for ((done=0; done<(elapsed / fit_to_screen) ; done=done+1 )); do printf "▇"; done }
    remaining() { for (( remain=(elapsed/fit_to_screen) ; remain<(duration/fit_to_screen) ; remain=remain+1 )); do printf " "; done }
    percentage() { printf "| %s%%" $(( ((elapsed)*100)/(duration)*100/100 )); }
    clean_line() { printf "\r"; }

    for (( elapsed=1; elapsed<=duration; elapsed=elapsed+1 )); do
        already_done; remaining; percentage
        sleep "$SLEEP_DURATION"
        clean_line
    done
    clean_line
}

progress-bar 10
END
