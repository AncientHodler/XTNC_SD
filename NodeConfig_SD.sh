#!/bin/bash
echo ""

#moving and p2pstatebin to its respective datastore location
#cp /XtendCash/p2pstate.bin /XtendCash/SN_Data

#Delete node acces files, so that they can be recreated again
cd /XtendCash

if [ -e 1_status.sh ]; then
  rm -rfv 1_status.sh
fi
#
if [ -e 2_sync_info.sh ]; then
  rm -rfv 2_sync_info.sh
fi

#Making shortcut files

#1)Making node status shortcut; Used to display node status
cat >> /XtendCash/1_status.sh <<EOL
#!/bin/bash
/XtendCash/xtendcashd status
EOL

#2)Making the sync info shortcut
cat >> /XtendCash/2_sync_info.sh <<EOL
#!/bin/bash
/XtendCash/xtendcashd sync_info
EOL

chmod a+x 1_status.sh
chmod a+x 2_sync_info.sh


#Rulare Demon XTNC
/XtendCash/xtendcashd --data-dir /XtendCash/SN_Data --confirm-external-bind --non-interactive --add-peer 51.68.191.40

#Standard ports are:
#--p2p-bind-port=33123 --zmq-rpc-bind-port=33124 --rpc-bind-port=33125
