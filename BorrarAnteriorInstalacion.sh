#!/bin/bash

initcolor()
{
    esc="\033"
    rojo="${esc}[31m${esc}[1m"
    verde="${esc}[32m${esc}[1m"
    amarillo="${esc}[33m${esc}[1m"
    negrita="${esc}[1m"
    reset="${esc}[0m"

}

initcolor

echo -e "${amarillo} Borrado de instalacion anterior.... ${reset}"
echo ''
echo -e "${rojo} Por favor introduce tu password de superusuario:${reset}"
    stty_orig=`stty -g`
    stty -echo
    read PASS
    stty $stty_orig
    clear

 # del /usr/local/ (lo dejamos por si acaso...)
    echo $PASS | sudo -S rm -rv /usr/local/lib/gambas3 /usr/local/share/gambas3
    sudo rm -v /usr/local/bin/gbr3 /usr/local/bin/gbx3 /usr/local/bin/gbs3* \
    /usr/local/bin/gbi3 /usr/local/bin/gbc3 /usr/local/bin/gba3    
    sudo rm -v /usr/local/bin/gambas3*

    # del /usr/
    sudo rm -rv /usr/lib/gambas3 /usr/share/gambas3
    sudo rm -v /usr/bin/gbr3 /usr/bin/gbx3 /usr/bin/gbs3* /usr/bin/gbi3 /usr/bin/gbc3 /usr/bin/gba3
    sudo rm -v /usr/bin/gambas3*
 echo -e "${verde} Borrado ${reset}"
