#!/usr/bin/zsh
mkdir ~/results
max=15
i=0
while [ $i -lt $max ]
do
    echo starting $i >> ~/results/ram_state.txt
    echo '5 \n 2 \n n ' | phoronix-test-suite benchmark pts/ramspeed  >> ~/results/ram.txt # cpu
    i=$(( $i + 1 ))
    echo finished $i >> ~/results/ram_state.txt
done
