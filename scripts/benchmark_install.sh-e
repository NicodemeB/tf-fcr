sudo apt install -y phoronix-test-suite unzip

# sudo add-apt-repository -y ppa:ondrej/php
# sudo apt update
# sudo apt install php5.6

phoronix-test-suite benchmark pts/stress-ng

# 21
# n

# echo '1 \n n' | phoronix-test-suite benchmark pts/stress-ng # cpu
echo 'n' | phoronix-test-suite benchmark pts/compress-7zip 

echo '3 \n 1 \n 3 \n n' | phoronix-test-suite benchmark pts/iozone # disk

echo '5 \n 3 \n n ' | phoronix-test-suite benchmark pts/ramspeed # ram 
