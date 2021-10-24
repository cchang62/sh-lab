#!/bin/zsh  

# Read the user input   

echo "Enter /path/to/vsc/exported/extensions/ext.list"  
read ext_file   # ./asset/test-lines.list
cnt=$(wc -l < $ext_file)
extsList=($(cat  $ext_file |tr "\n" " "))
_end=$(( $cnt-1 ))

: <<'END'
i=0
# myArray=("cat" "dog" "mouse" "frog") # OK
extsList=($(cat  $ext_file |tr "\n" " "))
echo $extsList
for extension in ${extsList[@]}; do
    ((i=i+1))
    echo $i 
    echo $extension
done

END

# 1. Create ProgressBar function
# 1.1 Input is currentState($1) and totalState($2)
function ProgressBar {
    # Process data
    _progress=$(( $1*100/$2*100/100 ))
    _done=$(( ($_progress*4)/10 ))
    _left=$(( (40-$_done) ))
    # Build progressbar string lengths
    _fill=$(printf "%${_done}s")
    _empty=$(printf "%${_left}s")

    # 1.2 Build progressbar strings and print the ProgressBar line
    # 1.2.1 Output example:                           
    # 1.2.1.1 Progress : [########################################] 100%
    printf "\rProgress : [${_fill// /#}${_empty// /-}] ${_progress}%%"
}


function main {
    i=0
    # myArray=("cat" "dog" "mouse" "frog") # OK
    # extsList=($(cat  $ext_file |tr "\n" " "))
    # echo $extsList
    for extension in ${extsList[@]}; do
        # echo $i 
        sleep 1

        ProgressBar ${i} ${_end}
        ((i=i+1))
        echo -ne $i $extension
    done
}

main 


printf '\nFinished!\n'




