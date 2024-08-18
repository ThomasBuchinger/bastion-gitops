
dnf install cockpit cockpit-podman podman git vim
systemctl enable --now cockpit.socket

dnf install wireguard-tools
vim /etc/wireguard/bastion.conf 
systemctl enable --now wg-quick@bastion
firewall-cmd --add-port 51820/udp
firewall-cmd --add-port 51820/udp --permanent
systemctl restart firewalld   


