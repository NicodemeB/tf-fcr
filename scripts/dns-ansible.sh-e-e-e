sudo bash -c 'echo nameserver 8.8.8.8' >> /etc/resolv.conf
# echo 'updating ...'
# sudo apt update >> /var/log/apt-update.log
# echo 'updated'
# echo 'installing ...'
# sudo apt install -y git ansible >> /var/log/apt-install.log
# echo 'installed ...'
ansible --version

sudo bash -c "git clone --quiet https://github.com/NicodemeB/custom-install.git >> /var/log/custom_install_root.log
cd custom-install 
git checkout redhat 
echo y | ./custom_install.sh -f -s -d debian >> /var/log/custom_install_root.log
cd .. 
rm -rf custom-install" >> /var/log/custom_install_root.log

bash -c "git clone --quiet https://github.com/NicodemeB/custom-install.git >> /var/log/custom_install.log
cd custom-install
echo y | ./custom_install.sh -s >> /var/log/custom_install.log
cd ..
rm -rf custom-install
sudo chsh ubuntu -s $(which zsh)" >> /var/log/custom_install.log

mkdir -p ~/.ssh/

echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDfDeufvY9W/Tdq0lqYppzArJ7222zXPUAj4RdmKIbGp76i4dEdXvIUwJ+C8kSq1rTifPSO7a+51h4Fy4xbZch9Z4lI0kbyQDnrUaEAe6NL0EjuYXUtJEDrkw7ElP0ECx1RJsAKtqWghXzkswJwqXCBEF8aX8GfmSJoyklwKKf3DglNoY6NdJUrBvztieLpRxNBLtaEHbuAif8ogtBzfKUyaCpps0FL4ObAhiB+LkDsNBpITd47rXkv9k/YzDpFAfJDFYXEu7H4sVIA+CotCTgDokqUzpLACAMMBBjXZD28wULSEMdiiivqzbiHK9sDSOI8QgPMv8qbw9Tps2/XNrTDc+3FHF2nAttCKCB/yASfR7DjmQCLC12t1d+4zHk8oGanOcJAgHDONATujsO+kd+CFuZGg7OuNfHzJW72GqKw8BBT+yd1kL+mXJVY4ZDGqnGue4W7GHsAMp1OaXPBwTsVFK1ncu2e9E/nnNK1aqS1EYnNhRi7yX+cp5S8ATelZhqs3LaMfz4OHdIrcWfvmFI7fkK5LocFRkmGeNnsj7SjOik3jmOrOxwCWVzPDXpwMhORit0Xz+dGYa9odCjVuKisfj3Bs1TdlDsT+kcOCAmDUXUQjv/pXsiiv9+kQ13U0KiGXlSk7zBSz1I359KC8OpJ7A9UCYGc44MwYfBawqYl3w== Benjamin@BenjaminMBP.local' >> ~/.ssh/authorized_keys

echo 'Finished!'
