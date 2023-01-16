#!/bin/bash
export DEBIAN_FRONTEND=noninteractive

apt update && apt -y full-upgrade
apt clean && apt autoclean && apt autoremove

wget https://github.com/prometheus/node_exporter/releases/download/v1.5.0/node_exporter-1.5.0.linux-amd64.tar.gz
tar xvf node_exporter-1.5.0.linux-amd64.tar.gz
cd node_exporter-1.5.0.linux-amd64
cp node_exporter /usr/local/bin
cd ..
rm -rf ./node_exporter-1.5.0.linux-amd64
rm node_exporter-1.5.0.linux-amd64.tar.gz

useradd --no-create-home --shell /bin/false node_exporter
chown node_exporter:node_exporter /usr/local/bin/node_exporter

cat << EOT >> /etc/systemd/system/node_exporter.service
[Unit]
Description=Prometheus Node Exporter
Wants=network-online.target
After=network-online.target

[Service]
User=node_exporter
Group=node_exporter
Type=simple
ExecStart=/usr/local/bin/node_exporter

[Install]
WantedBy=multi-user.target
EOT

systemctl daemon-reload
systemctl enable node_exporter
systemctl start node_exporter

rm node-exporter-installer.sh