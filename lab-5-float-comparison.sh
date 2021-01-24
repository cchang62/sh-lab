#!/bin/bash
# ################# Duplicated at https://github.com/cchang62/linux_float_comparison 
# float_comparison.sh
# Bash can not do floats, but zsh and ksh can. 
echo "========= awk does floats comparison ========="
# var=$(cat /etc/passwd | awk 'BEGIN {FS=":"} $3 < -2 {print $1 }') #OK syntax
# var=$(echo $float_value_1 $float_value_2| awk '$1 > $2 {print 1}') # OK, cant add BEGIN
# var1=$(echo 500 | awk '{print ($1 > 300) ? $1 : "0"}') #OK syntax
# var2=$(echo 10 | awk '{print ('$float_value_1' > $1) ? '$float_value_1' : $1}') #OK syntax
# var=$(awk -v f1=${float_value_1} -v f2=${float_value_2} 'BEGIN f1<f2 {print f2}')
# echo $var1
# echo $var2 
# var=$(awk 'BEGIN{ print "'$float_value_1'"<"'$float_value_2'" }')  # --Not work-- on Mac

float_value_1=17.99
float_value_2=36.223
var=$(awk 'BEGIN {print ('$float_value_1' > '$float_value_2') ? 1 : 0}')  #OK syntax 
# var=$(echo | awk '{print ('$float_value_1' < '$float_value_2') ? '$float_value_1' : '$float_value_2'}')  #OK syntax
# Alternative syntax
# 1. var=$(awk -v f1=$float_value_1 -v f2=$float_value_2 'BEGIN{print f2<f1?1:0}')
# 2. var=$(awk 'BEGIN{print "'$float_value_2'"<"'$float_value_1'"?1:0}')

if [ $var -eq 1 ];then
    echo "float_value_1 is larger."
else
    echo "float_value_2 is larger"
fi


# //Result
# //========= awk does floats comparison =========
# //float_value_2 is larger



###############################################################

echo "========= bc does floats comparison ========="
float_value_1="99.99"
float_value_2="36.223"
if [ $(bc <<< "$float_value_2 <= $float_value_1") -eq 1 ];
    then
    echo "float_value_1 is larger than float_value_2"
fi


# // Result
# // ========= bc does floats comparison =========
# // float_value_1 is larger than float_value_2
# :ambulance: