# Ref. https://stackoverflow.com/questions/11393817/read-lines-from-a-file-into-a-bash-array
file="./asset/test-lines.list"

# Test-1
# lines=`cat $file`
# i=0
# for line in $lines; do
#     ((i=i+1))
#     echo "$i $line"
# done

# Test-2
# fileItemString=$(cat  $file |tr "\n" " ")
# fileItemArray=($fileItemString)
# 
# # ${fileItemArray[*]}
# # Length=${#fileItemArray[@]}
# 
# echo $fileItemArray
# echo $Length
# for line in $fileItemArray; do
#     echo "1 $line"
# done

# Test-3
# IFS=$'\n' read -d '' -r -a lines < $file
# printf "line 1: %s\n" "${lines[0]}"
# printf "line 5: %s\n" "${lines[4]}"
# 
# # all lines
# echo "${lines[@]}"

# Test-4    # OK-Edition
# Ref. https://www.freecodecamp.org/news/bash-array-how-to-declare-an-array-of-strings-in-a-bash-script/
i=0
# myArray=("cat" "dog" "mouse" "frog") # OK
myArray=($(cat  $file |tr "\n" " "))
echo $myArray
for str in ${myArray[@]}; do
    ((i=i+1))
    echo $i $str
done