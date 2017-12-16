#!/bin/sh
set -e
echo "Installing yarn libraries....."
yarn install > /tmp/npm-install.log 2>&1
cd functions && yarn install
cd ..
echo "...done\n"
exec yarn run dev
