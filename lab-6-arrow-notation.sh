#!/bin/bash

# ################# Duplicated at https://github.com/cchang62/linux_float_comparison 

read first second <<< "hello world"
echo $second $first
### StdOut ###
# world hello


# // #######################
# <<< denotes here is a string.
cat <<< 'Hello world'
### StdOut ###
# Hello world


# // #######################
# << denotes here is a document.

cat <<EOF
Hello
world
EOF
### StdOut ###
# Hello
# world

# EOF can be any word.


# // #######################
# > denotes passing content to a xxx.file.

cat > xxx.file <<FILE
Hello
world
FILE


# // #######################
# < passes the contents of a file to a command's standard input.

cat < ./xxx.txt 
### StdOut ###
# hello
# world