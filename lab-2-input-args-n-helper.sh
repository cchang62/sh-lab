#!/bin/bash
# Method-1
# Usage demo-space-separated.sh -e conf -s /etc -l /usr/lib /etc/hosts
# Ref. https://stackoverflow.com/questions/192249/how-do-i-parse-command-line-arguments-in-bash
POSITIONAL=()
while [[ $# -gt 0 ]]
do
key="$1"

case $key in
    -e|--extension)
    EXTENSION="$2"
    shift # past argument
    shift # past value
    ;;
    -s|--searchpath)
    SEARCHPATH="$2"
    shift # past argument
    shift # past value
    ;;
    -l|--lib)
    LIBPATH="$2"
    shift # past argument
    shift # past value
    ;;
    --default)
    DEFAULT=YES
    shift # past argument
    ;;
    *)    # unknown option
    POSITIONAL+=("$1") # save it in an array for later
    shift # past argument
    ;;
esac
done
set -- "${POSITIONAL[@]}" # restore positional parameters

echo "FILE EXTENSION  = ${EXTENSION}"
echo "SEARCH PATH     = ${SEARCHPATH}"
echo "LIBRARY PATH    = ${LIBPATH}"
echo "DEFAULT         = ${DEFAULT}"
echo "Number files in SEARCH PATH with EXTENSION:" $(ls -1 "${SEARCHPATH}"/*."${EXTENSION}" | wc -l)
if [[ -n $1 ]]; then
    echo "Last line of file specified as non-opt/last argument:"
    tail -1 "$1"
fi

# Method-2
# Usage demo-space-separated.sh -e conf -s /etc -l /usr/lib /etc/hosts
# Ref. https://opensource.com/article/19/12/help-bash-program
if [ -z "$*" ];
then
    echo "no argument"
    exit 1
fi

Help()
{
    # Display Help
    echo "The script function updates the app service."
    echo
    echo "Usage: bash /path/to/app_cd.sh -p /path/to/private_key -a /path/to/app_root"
    echo
    echo "Syntax: cmd [-h|p <arg>|a <arg>]"
    echo "options:"
    echo "p     Set private key. p: private key."
    echo "a     Set app root path. a: app root."
    echo "h     Print this Help."
    echo
}

while getopts ":p:a:h" OPTION; do
    case $OPTION in
        h) # display Help
            Help
            exit;;
        p)
            PRIVATE_KEY=$OPTARG
            ;;
        a)
            APP_ROOT=$OPTARG
            ;;
    esac
done