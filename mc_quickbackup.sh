#!/bin/bash

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
mv "$PATH_MC.persistent" "$PATH_MC.persistent.bak" 2>/dev/null
rsync -avzh /home/steven/minecraft-server /home/steven/minecraft-server.persistent/
if [ $? -ne 0 ]; then
    echo "Something went wrong while backing up."
    echo "An older copy can be found in $PATH_MC.persist.bak"
    exit 1
else
    rm -rf "$PATH_MC.persistent.bak"
fi
# Turn world saving back on
tmux send -t "minecraft" "save-on" C-m
