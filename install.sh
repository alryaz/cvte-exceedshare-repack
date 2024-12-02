#!/bin/sh
# To add this repository please do:

if [ "$(whoami)" != "root" ]; then
    SUDO=sudo
fi

KEYRING=/usr/share/keyrings/cvte.exceedshare.repack.gpg

${SUDO} apt-get update
${SUDO} apt-get -y install apt-transport-https
wget -qO- https://alryaz.github.io/cvte-exceedshare-repack/public.key | gpg --dearmor - | ${SUDO} tee $KEYRING >/dev/null
${SUDO} sh -c 'echo "deb [signed-by='$KEYRING'] https://alryaz.github.io/cvte-exceedshare-repack/repo/ debian main" > /etc/apt/sources.list.d/cvte.exceedshare.list'
${SUDO} apt-get update
