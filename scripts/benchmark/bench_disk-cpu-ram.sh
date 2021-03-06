#!/usr/bin/zsh
mkdir ~/results
max=15

i=0
while [ $i -lt $max ]
do
    echo starting $i >> ~/results/disk_state.txt
    echo '3 \n 1 \n 3 \n n' | phoronix-test-suite benchmark pts/iozone  >> ~/results/disk.txt # cpu
    echo finished $i >> ~/results/disk_state.txt
    i=$(( $i + 1 ))
done

i=0
while [ $i -lt $max ]
do
    echo starting $i >> ~/results/cpu_state.txt
    echo 'n' | phoronix-test-suite benchmark pts/compress-7zip  >> ~/results/cpu.txt # cpu
    echo finished $i >> ~/results/cpu_state.txt
    i=$(( $i + 1 ))
done

i=0
while [ $i -lt $max ]
do
    echo starting $i >> ~/results/ram_state.txt
    echo '5 \n 2 \n n ' | phoronix-test-suite benchmark pts/ramspeed  >> ~/results/ram.txt # cpu
    echo finished $i >> ~/results/ram_state.txt
    i=$(( $i + 1 ))
done
