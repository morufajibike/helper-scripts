
# create a dedicated user and group
sudo useradd -M -r -s /bin/false prometheus

# getting things ready for prometheus
sudo mkdir /etc/prometheus /var/lib/prometheus

# download and unzip prometheus
wget https://github.com/prometheus/prometheus/releases/download/v2.34.0/prometheus-2.34.0.linux-amd64.tar.gz
tar xzf prometheus-2.34.0.linux-amd64.tar.gz prometheus-2.34.0.linux-amd64/
ls prometheus-2.34.0.linux-amd64

# copy prometheus binaries to appropriate locations
sudo cp prometheus-2.34.0.linux-amd64/prometheus prometheus-2.34.0.linux-amd64/promtool /usr/local/bin
sudo cp -r prometheus-2.34.0.linux-amd64/consoles prometheus-2.34.0.linux-amd64/console_libraries /etc/prometheus/
sudo cp prometheus-2.34.0.linux-amd64/prometheus.yml /etc/prometheus/prometheus.yml

# change binaries and directory ownership
sudo chown prometheus:prometheus /usr/local/bin/prometheus /usr/local/bin/promtool
sudo chown -R prometheus:prometheus /etc/prometheus
sudo chown prometheus:prometheus /var/lib/prometheus

# start prometheus in foreground to test it
start_prometheus=$(prometheus --config.file=/etc/prometheus/prometheus.yml)
echo $start_prometheus

## start prometheus in systemd
# sudo vi /etc/systemd/system/prometheus.service
cat <<EOF > /etc/systemd/system/prometheus.service
[Unit]
Description=Prometheus Time Series Collection and Processing Server
Wants=network-online.target
After=network-online.target

[Service]
User=prometheus
Group=prometheus
Type=simple
ExecStart=/usr/local/bin/prometheus \
    --config.file /etc/prometheus/prometheus.yml \
    --storage.tsdb.path /var/lib/prometheus/ \
    --web.console.templates=/etc/prometheus/consoles \
    --web.console.libraries=/etc/prometheus/console_libraries

[Install]
WantedBy=multi-user.target
EOF
# sudo systemctl daemon-reload
# sudo systemctl start prometheus
# sudo systemctl enable prometheus
# sudo systemctl status prometheus
# curl localhost:9090
# curl localhost:9090/api/v1/status/config

## to restart prometheus with killall HUP signal
# sudo killall -HUP prometheus
