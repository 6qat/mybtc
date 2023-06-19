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

/opt/bitcoin/bin/bitcoind --daemon --server -port=8333 -pid=/mnt/blockchain/btc-data/bitcoind.pid -datadir=/mnt/blockchain/btc-data/ -conf=/mnt/blockchain/btc-data/bitcoin.conf #-connect=10.8.0.3:8333 -connect=54.39.22.116:8333  -connect=187.55.40.86:8333 -connect=179.235.204.165:8333 -connect=186.218.58.150:8333

echo "Done!"

