# Lukso Node

A lukso validator node with a support for Prysm and Lighthosue as a beacon and a validator clients. This node also includes promethus monitoring with grafana dashboard.

## Minimum Requirements

Name | Description
---- | -----------
OS | Ubuntu 22 LTS
CPU | 4 core/thread
RAM | 8 GB
Disk | 150 GB NVMe SSD
Bandwidth | 5 Mbps Up/Down
Data | 1.5 TB/month

## Setup

#### Prerequisites

1. Docker. Install it by following [few steps](https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository).

#### Setup Environment

```shell
cp .env.example .env
```

#### Validator Access

Set your validator password in a file `secrets/validator_password`.

```shell
nano secrets/validator_password
```

Restrict access to password with `sudo` only:

```shell
sudo chown root:root secrets/validator_password
sudo chmod 400 secrets/validator_password
```

#### Validators

Copy all validator keystores (`keystore-...json`) in `validators` folder.

#### Withdrawal

Setup your withdrawal address for fees and rewards in `.env` file for `WITHDRAWAL_ADDRESS=`:

```shell
nano .env
```

#### Improve Discovery

Improve discovery of your node by publushing your node's IP address. Resolve IP address and set it int `.env` file for `EXTERNAL_IP=`:

```shell
curl https://ipinfo.io/ip # prints your IP address
nano .env
```

#### Monitoring

Enable monitoring by setting up your password to grafana and secure access. Set password in `.env` file for `GRAFANA_PASSWORD=`:

```shell
nano .env
```

Setup secure access:

```shell
cd grafana/etc
sudo openssl genrsa -out grafana.key 2048
sudo openssl req -new -key grafana.key -out grafana.csr
sudo openssl x509 -req -days 365 -in grafana.csr -signkey grafana.key -out grafana.crt
sudo chmod 400 grafana.key grafana.crt
```

## Start

```shell
sudo docker compose up -d
```

to stop run:

```shell
sudo docker compose down
```

## Monitor

Replace IP address with your node's IP and navigate to `https://IP:46321`. Select advance settings and proceed to an unsafe connection if prompted by a web browser. It may take some time to fully sync the chain, but some metrics should be populated within few minutes.
