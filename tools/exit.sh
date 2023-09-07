#!/bin/bash

first=$1
last=$2
password=$3

for (( i=$first; i<=$last; i++ ))
do
  read -p "Exiting validator ${i}, continue? " -n 1 -r
  echo

  keystore=$(find /validators/ -name "keystore-m_12381_3600_${i}_*")

  echo $password | lighthouse account \
    validator exit \
    --datadir /consensus_data \
    --testnet-dir /configs \
    --beacon-node http://127.0.0.1:4000 \
    --no-confirmation \
    --no-wait \
    --stdin-inputs \
    --keystore $keystore
done
