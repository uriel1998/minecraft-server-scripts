#!/bin/bash

rsync -avzh /home/steven/minecraft-server.persistent/ /home/steven/minecraft-server
cd /home/steven/minecraft-server/

sudo /usr/bin/nice -n -20 /usr/bin/ionice -c 1 -n 0 java -server -Xms3G -Xmx3G -XX:+UnlockExperimentalVMOptions -XX:+UseG1GC -Dsun.rmi.dgc.server.gcInterval=2147483646 -XX:+DisableExplicitGC -XX:G1NewSizePercent=20 -XX:G1ReservePercent=20 -XX:MaxGCPauseMillis=25 -XX:G1HeapRegionSize=4M -XX:SoftRefLRUPolicyMSPerMB=10000 -XX:+AggressiveOpts -XX:ParallelGCThreads=4 -jar fabric-server-launch.jar nogui --forceUpgrade

echo "Copying stuff to backup!"

rsync -avzh /home/steven/minecraft-server /home/steven/minecraft-server.persistent/
