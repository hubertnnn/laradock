#!/bin/bash

NODE_VERSION=`ls -1 /home/laradock/.nvm/versions/node/ | tail -n 1`
PATH="/home/laradock/.nvm/versions/node/$NODE_VERSION/bin:$PATH"

cd /var/www

if [ -f '/root/.workspace/status/.installed' ]; then
   echo "Service already installed"
   eval $COMMAND_BOOTSTRAP
else
   echo "Installing service"
   eval $COMMAND_INSTALL
   touch /root/.workspace/status/.installed
   eval $COMMAND_BOOTSTRAP
fi

exit 0
