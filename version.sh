#!/bin/bash -x

function versioncheck(){

version=$(cat /etc/lsb-release|grep "DISTRIB_ID"|cut -d= -f2)

if [[ $version == "Ubuntu" ]]; then
echo $version
echo "Ubuntu Detected"
else
echo "Something else"
fi
}

#Main

if [[ $Host == "localhost" ]]; then

versioncheck

else

echo "Remote connection"

sshpass -p 'edureka' ssh -o StrictHostKeyChecking=no edureka@192.168.56.102 cat /etc/lsb-release

fi
