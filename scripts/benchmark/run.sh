rm -rf ~/results
killall screen 

sleep 5

screen -d -m ~/benchmark/bench_disk-cpu-ram.sh

sleep 5

tail -f ~/results/*state*
