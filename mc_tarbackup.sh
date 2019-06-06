#!/bin/bash

#!/bin/bash
#name=$(date +%m%d%H%M)

PATH_MC="/home/steven/minecraft-server"

# Temporary turn off MC saving so we don't get a corrupt backup
tmux send -t "minecraft" "save-off" C-m
tmux send -t "minecraft" "save-all" C-m
# Wait until the MC server log indicates the save is complete
while true; do
    sleep 0.2
    TMP=`tail -n 3 $PATH_MC/logs/latest.log | grep -c "Saved the game" `
    if [ $TMP -gt 0 ]; then
        break
    fi
done
# Create persistent copy from RAM to disk
name=$(date +%m%d%H%M)
tar -cvpzf /home/steven/vault/minecraftworld_$name.tar.gz /home/steven/minecraft-server-1-14-2_fabric/world
# Turn world saving back on
tmux send -t "minecraft" "save-on" C-m
#cp -rf /home/steven/minecraft-server-1-14-2_fabric/world/ /home/steven/minecraft-server-1-14-2_fabric/backup/


