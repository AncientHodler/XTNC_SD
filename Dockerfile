# build from stock debian image
FROM ubuntu:18.04

# install needed packages
RUN apt-get update && apt-get install -y procps wget net-tools cron screen nano && rm -rf /var/lib/apt/lists/*

#Install Folder Structure
RUN mkdir -p XtendCash/SN_Data


ADD xtendcashd /XtendCash
#ADD p2pstate.bin /XtendCash
ADD NodeConfig_SD.sh /XtendCash

ENTRYPOINT ["/XtendCash/NodeConfig_SD.sh"]
