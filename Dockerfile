# build from stock debian image
FROM ubuntu:18.04

# install needed packages
RUN apt-get update && apt-get install -y procps wget net-tools cron screen nano && rm -rf /var/lib/apt/lists/*

#Install Folder Structure
RUN mkdir -p XtendCash/SN_Data
RUN mkdir -p XtendCash/SN_Keys

ADD xtendcashd /XtendCash
ADD SN_Keys /XtendCash/SN_Keys
ADD p2pstate.bin /XtendCash
ADD NodeConfig.sh /XtendCash

ENTRYPOINT ["/XtendCash/NodeConfig.sh"]
