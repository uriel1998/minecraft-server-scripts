#!/bin/bash
#name=$(date +%m%d%H%M)

cp -far /home/steven/minecraft-server.persistent/* /home/steven/minecraft-server/
cd /home/steven/minecraft-server/

#/usr/java/jdk1.8.0_211-amd64/bin/java -server -Xms2G -Xmx2G -XX:+UnlockExperimentalVMOptions -XX:+UseG1GC -Dsun.rmi.dgc.server.gcInterval=2147483646 -XX:+DisableExplicitGC -XX:G1NewSizePercent=20 -XX:G1ReservePercent=20 -XX:MaxGCPauseMillis=25 -XX:G1HeapRegionSize=4M -XX:SoftRefLRUPolicyMSPerMB=10000 -XX:+AggressiveOpts -XX:ParallelGCThreads=4 -jar fabric-server-launch.jar nogui --forceUpgrade

#sudo update-alternatives --config java


sudo /usr/bin/nice -n -20 /usr/bin/ionice -c 1 -n 0 java -server -Xms3G -Xmx3G -XX:+UnlockExperimentalVMOptions -XX:+UseG1GC -Dsun.rmi.dgc.server.gcInterval=2147483646 -XX:+DisableExplicitGC -XX:G1NewSizePercent=20 -XX:G1ReservePercent=20 -XX:MaxGCPauseMillis=25 -XX:G1HeapRegionSize=4M -XX:SoftRefLRUPolicyMSPerMB=10000 -XX:+AggressiveOpts -XX:ParallelGCThreads=4 -jar fabric-server-launch.jar nogui --forceUpgrade

echo "Copying stuff to backup!"
cp -far /home/steven/minecraft-server/* /home/steven/minecraft-server.persistent/
#cp -rf /home/steven/minecraft-server-1-14-2_fabric/world/ /home/steven/minecraft-server-1-14-2_fabric/backup/

