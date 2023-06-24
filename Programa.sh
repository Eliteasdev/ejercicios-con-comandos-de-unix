#!/bin/bash

#Script que comprueba el hash de un archivo

file=$1
hashVerification=$2
longHash=${#hashVerification}
log=$(($longHash))

case $log in
    40)
        shaOutput=`sha1sum $file`
        hash=${shaOutput:0:40}
    ;;
    56)
        shaOutput=`sha224sum $file`
        hash=${shaOutput:0:56}
    ;;
    64)
        shaOutput=`sha256sum $file`
        hash=${shaOutput:0:64}
    ;;
    96)
        shaOutput=`sha384sum $file`
        hash=${shaOutput:0:96}
    ;;
    128)
        shaOutput=`sha512sum $file`
        hash=${shaOutput:0:128}
    ;;
    *)
        echo "Debes de ingresar una codificacion valida."
esac

if [ "$hash" == "$hashVerification" ]; then
        echo -e "\e[1;32m OK, los Hashes coinciden. \e[0m"
    else
        echo -e "\e[1;31m Error, Los Hashes no coinciden. \e[0m"
fi