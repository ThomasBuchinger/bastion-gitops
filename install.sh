
dnf install cockpit cockpit-podman podman git vim
systemctl enable --now cockpit.socket

dnf install wireguard-tools
vim /etc/wireguard/bastion.conf 
systemctl enable --now wg-quick@bastion
firewall-cmd --add-port 51820/udp
firewall-cmd --add-port 51820/udp --permanent
systemctl restart firewalld   

dnf eanble copr @caddy/caddy
dnf install caddy
systemctl enable --now caddy


# We don't have compose available in RHEL9, therefore we can use K8s Pod Manifests to define pods
podman kube play --replace podman/nodeexporter.yaml
firewall-cmd --add-port 9100/tcp
firewall-cmd --add-port 9100/tcp --permanent
