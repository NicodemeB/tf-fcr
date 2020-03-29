sudo bash -c 'echo nameserver 8.8.8.8' >> /etc/resolv.conf
echo 'updating ...'
sudo apt update >> /var/log/apt-update.log
echo 'updated'
echo 'installing ...'
sudo apt install -y git ansible >> /var/log/apt-install.log
echo 'installed ...'
ansible --version
