#!/bin/bash

# Just a simple wrapper to start bitcoind.
#
# If using systemd, simply create a file (e.g. /etc/systemd/system/bitcoind.service) 
# from example file below and add this script in ExecStart.
# https://raw.githubusercontent.com-/bitcoin/bitcoin/76deb30550b2492f9c8d9f0302da32025166e0c5/contrib/init/bitcoind.service
#
# Then run following to always start:
# systemctl enable bitcoind
#
# and the following to start immediately:
# systemctl start bitcoind

# If you are mounting a secondary disk, find the UUID of your
# disk and a line entry in /etc/fstab e.g.
#
# UUID=foo-bar-1234 /path-to-dir/.bitcoin ext4 defaults 0 0

set -e

# Let's wait for 30 seconds in case other processes need to come up first.
sleep 2 

echo "Starting bitcoind..."

/opt/bitcoin/bin/bitcoind --daemon --server -pid=/mnt/blockchain/bitcoind.pid -datadir=/mnt/blockchain/ -conf=/mnt/blockchain/bitcoin.conf #-reindex 

echo "Done!"

