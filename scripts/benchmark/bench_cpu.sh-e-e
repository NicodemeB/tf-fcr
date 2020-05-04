#!/usr/bin/zsh
mkdir ~/results
max=15
i=0
while [ $i -lt $max ]
do
    echo starting $i >> ~/results/cpu_state.txt
    echo 'n' | phoronix-test-suite benchmark pts/compress-7zip  >> ~/results/cpu.txt # cpu
    i=$(( $i + 1 ))
    echo finished $i >> ~/results/cpu_state.txt
done
