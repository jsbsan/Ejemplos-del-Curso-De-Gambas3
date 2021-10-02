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

echo -e "${amarillo} This will install latest Gambas3 SVN ${reset}"
echo ''
echo -e "${rojo} Please, enter you root password:${reset}"
    stty_orig=`stty -g`
    stty -echo
    read PASS
    stty $stty_orig
    clear
    echo -e "${rojo} Old Gambas3 instalation files will be removed, continue?${reset}"

OPTIONS="Yes No"
select opt in $OPTIONS; do
   if [ "$opt" = "No" ]; then
    echo 'Exiting'
    exit
   elif [ "$opt" = "Yes" ]; then
    echo -e "${rojo} Deleting files...${reset}"

    # del /usr/local/ (lo dejamos por si acaso...)
    echo $PASS | sudo -S rm -rv /usr/local/lib/gambas3 /usr/local/share/gambas3
    sudo rm -v /usr/local/bin/gbr3 /usr/local/bin/gbx3 /usr/local/bin/gbs3* \
    /usr/local/bin/gbi3 /usr/local/bin/gbc3 /usr/local/bin/gba3    
    sudo rm -v /usr/local/bin/gambas3*

    # del /usr/
    sudo rm -rv /usr/lib/gambas3 /usr/share/gambas3
    sudo rm -v /usr/bin/gbr3 /usr/bin/gbx3 /usr/bin/gbs3* /usr/bin/gbi3 /usr/bin/gbc3 /usr/bin/gba3
    sudo rm -v /usr/bin/gambas3*
    clear
    break
   else
    echo -e "${negrita} Incorrect option, 1) Proceed, 2) Exit${reset}"
   fi
done

echo -e "${verde} Old files of Gambas3 were removed${reset}"
echo ''
echo -e "${amarillo} Now, we're going to checkout Gambas3 SVN${reset}"
echo -e "${amarillo} Checking for SVN in your system${reset}"
SVN=$(which svn)
if [ -z $SVN ]; then
 echo -e "${verde} Installing Subversion...${reset}"
 echo $PASS | sudo -S apt-get --assume-yes install subversion
fi
echo ''
echo -e "${verde} SVN Installed... Creating temp folder${reset}"
cd ~
rm -rf ~/trunk
mkdir trunk

release="`cat /etc/lsb-release 2>/dev/null | grep CODENAME | awk -F= '{print $2}'`"
echo -e "${amarillo} Installing developer dependencies $release...${reset}"
sleep 3
case $release in
    hardy)
        echo $PASS | sudo -S apt-get --assume-yes install build-essential g++ automake autoconf libbz2-dev \
        libgnorba-dev libfbclient2  libmysqlclient15-dev  unixodbc-dev libpq-dev libsqlite0-dev \
        libgtk2.0-dev libldap2-dev libcurl3-dev  libgtkglext1-dev  libqt3-mt-dev kdebase-dev \
        libpcre3-dev libsdl-sound1.2-dev libsdl-mixer1.2-dev libsdl-image1.2-dev  libsage-dev \
        libxml2-dev libxslt1-dev build-essential libbonobo2-dev libcos4-dev libomniorb4-dev \
        firebird2.0-dev librsvg2-dev  libpoppler-dev libpoppler-dev libpoppler-glib-dev \
        libasound2-dev libartsc0-dev libesd0-dev libesd-alsa0 libdirectfb-dev libaa1-dev \
        libarts1-dev kdelibs4-dev libffi4-dev libxtst-dev gettext libsqlite3-dev

    ;;

    intrepid)
        echo $PASS | sudo -S apt-get --assume-yes install build-essential autoconf libbz2-dev libgnorba-dev \
        libmysqlclient15-dev unixodbc-dev libpq-dev libsqlite0-dev libsqlite3-dev libgtk2.0-dev \
        libldap2-dev libcurl4-gnutls-dev libgtkglext1-dev libpcre3-dev libsdl-sound1.2-dev \
        libsdl-mixer1.2-dev libsdl-image1.2-dev libsage-dev libxml2-dev libxslt1-dev libbonobo2-dev \
        libcos4-dev libomniorb4-dev librsvg2-dev libpoppler-dev libpoppler-glib-dev libasound2-dev \
        libartsc0-dev libesd0-dev libesd-alsa0 libdirectfb-dev libaa1-dev libarts1-dev libxtst-dev \
        libffi-dev kdelibs4-dev firebird2.1-dev libqt4-dev libfbclient2

    ;;

    jaunty)
        echo $PASS | sudo -S apt-get --assume-yes install build-essential autoconf libbz2-dev libgnorba-dev \
        libfbclient2 libmysqlclient15-dev unixodbc-dev libpq-dev libsqlite0-dev libsqlite3-dev \
        libgtk2.0-dev libldap2-dev libcurl4-gnutls-dev libgtkglext1-dev libpcre3-dev libsdl-sound1.2-dev \
        libsdl-mixer1.2-dev libsdl-image1.2-dev libsage-dev libxml2-dev libxslt1-dev libbonobo2-dev \
        libcos4-dev libomniorb4-dev librsvg2-dev libpoppler-dev libpoppler-glib-dev libasound2-dev \
        libesd0-dev libesd-alsa0 libdirectfb-dev libaa1-dev libxtst-dev libffi-dev kdelibs4-dev \
        firebird2.1-dev libqt4-dev libglew1.5-dev libimlib2-dev libv4l-dev libsdl-ttf2.0-dev

    ;;

    karmic|lucid)
        echo $PASS | sudo -S apt-get --assume-yes install build-essential autoconf libbz2-dev libfbclient2 \
        libmysqlclient15-dev unixodbc-dev libpq-dev libsqlite0-dev libsqlite3-dev libgtk2.0-dev \
        libldap2-dev libcurl4-gnutls-dev libgtkglext1-dev libpcre3-dev libsdl-sound1.2-dev \
        libsdl-mixer1.2-dev libsdl-image1.2-dev libsage-dev libxml2-dev libxslt1-dev libbonobo2-dev \
        libcos4-dev libomniorb4-dev librsvg2-dev libpoppler-dev libpoppler-glib-dev libasound2-dev \
        libesd0-dev libesd-alsa0 libdirectfb-dev libaa1-dev libxtst-dev libffi-dev kdelibs4-dev \
        firebird2.1-dev libqt4-dev libglew1.5-dev libimlib2-dev libv4l-dev libsdl-ttf2.0-dev

    ;;

    maverick|julia|natty|katya)
        echo $PASS | sudo -S apt-get --assume-yes install build-essential autoconf libbz2-dev libfbclient2 \
        libmysqlclient-dev unixodbc-dev libpq-dev libsqlite0-dev libsqlite3-dev libgtk2.0-dev libldap2-dev \
        libcurl4-gnutls-dev libgtkglext1-dev libpcre3-dev libsdl-sound1.2-dev libsdl-mixer1.2-dev \
        libsdl-image1.2-dev libsage-dev libxml2-dev libxslt1-dev libbonobo2-dev libcos4-dev libomniorb4-dev \
        librsvg2-dev libpoppler-dev libpoppler-glib-dev libasound2-dev libesd0-dev libdirectfb-dev libaa1-dev \
        libxtst-dev libffi-dev kdelibs4-dev firebird2.1-dev libqt4-dev libglew1.5-dev libimlib2-dev libv4l-dev \
        libsdl-ttf2.0-dev libgnome-keyring-dev libgdk-pixbuf2.0-dev

    ;;

    oneiric|lisa)
        echo $PASS | sudo -S apt-get --assume-yes install build-essential autoconf libbz2-dev libfbclient2 \
        libmysqlclient-dev unixodbc-dev libpq-dev libsqlite0-dev libsqlite3-dev libgtk2.0-dev libldap2-dev \
        libcurl4-gnutls-dev libgtkglext1-dev libpcre3-dev libsdl-sound1.2-dev libsdl-mixer1.2-dev \
        libsdl-image1.2-dev libsage-dev libxml2-dev libxslt1-dev libbonobo2-dev libcos4-dev libomniorb4-dev \
        librsvg2-dev libpoppler-dev libpoppler-glib-dev libasound2-dev libesd0-dev libdirectfb-dev libaa1-dev \
        libxtst-dev libffi-dev kdelibs5-dev firebird2.1-dev libqt4-dev libglew1.5-dev libimlib2-dev libv4l-dev \
        libsdl-ttf2.0-dev libgnome-keyring-dev libgdk-pixbuf2.0-dev

    ;;


    precise|maya)
        echo $PASS | sudo -S apt-get --assume-yes install build-essential autoconf libbz2-dev \
        libmysqlclient-dev unixodbc-dev libpq-dev libsqlite0-dev libsqlite3-dev libgtk2.0-dev \
        libcurl4-gnutls-dev libgtkglext1-dev libpcre3-dev libsdl-sound1.2-dev libsdl-mixer1.2-dev \
        libsdl-image1.2-dev libxml2-dev libxslt1-dev librsvg2-dev libpoppler-dev libpoppler-glib-dev \
        libxtst-dev libffi-dev libqt4-dev libglew1.5-dev libimlib2-dev libv4l-dev libsdl-ttf2.0-dev \
        libgnome-keyring-dev libgdk-pixbuf2.0-dev linux-libc-dev libgsl0-dev libgstreamer0.10-dev \
        libgstreamer-plugins-base0.10-dev

    ;;
    *)
       echo $PASS | sudo -S apt-get --assume-yes install build-essential autoconf libbz2-dev \
        libmysqlclient-dev unixodbc-dev libpq-dev libsqlite0-dev libsqlite3-dev libgtk2.0-dev \
        libcurl4-gnutls-dev libgtkglext1-dev libpcre3-dev libsdl-sound1.2-dev libsdl-mixer1.2-dev \
        libsdl-image1.2-dev libxml2-dev libxslt1-dev librsvg2-dev libpoppler-dev libpoppler-glib-dev \
        libxtst-dev libffi-dev libqt4-dev libglew1.5-dev libimlib2-dev libv4l-dev libsdl-ttf2.0-dev \
        libgnome-keyring-dev libgdk-pixbuf2.0-dev linux-libc-dev libgsl0-dev libgstreamer0.10-dev \
        libgstreamer-plugins-base0.10-dev
    ;;
esac

echo ''
echo -e "${amarillo} Downloading latest revision, please wait (it takes a while)...${reset}"
svn checkout https://gambas.svn.sourceforge.net/svnroot/gambas/gambas/trunk/
cd trunk
echo ''
echo -e "${verde} Checked out. Now configuring and compiling, please be patient.${reset}"
sleep 3

./reconf-all #> reconf.txt 2>&1


echo ''
echo -e "${rojo} Configuring...${reset}"
sleep 3

./configure -C #> conf.txt 2>&1

echo ''
echo -e "${rojo} Compiling...${reset}"
sleep 3

make #> make.txt 2>&1

echo ''
echo -e "${rojo} Installing...${reset}"
sleep 3

echo $PASS | sudo -S make install #> install.txt 2>&1

echo ''
echo -e "${verde} We are finished. You can now start Gambas by typing 'gambas3' in your terminal ${reset}"

echo -e "${amarillo} Press 'enter' to exit.${reset}"


read
