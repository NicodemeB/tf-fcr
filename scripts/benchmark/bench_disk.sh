#!/usr/bin/zsh
mkdir ~/results
max=15
i=0
while [ $i -lt $max ]
do
    echo starting $i >> ~/results/disk_state.txt
    echo '3 \n 1 \n 3 \n n' | phoronix-test-suite benchmark pts/iozone  >> ~/results/disk.txt # cpu
    i=$(( $i + 1 ))
    echo finished $i >> ~/results/disk_state.txt
done

