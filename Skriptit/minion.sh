#!/bin/bash
# Päivitä pakettivarastot
sudo apt-get update
# Asenna Salt Minion
sudo apt-get install salt-minion -y

# Konfiguroi Salt Minion käyttämään t001 masterina
# Lisää uusi rivi minionin tekstitiedoston loppuun.
echo 'master: 192.168.88.101' | sudo tee -a /etc/salt/minion

# Käynnistä Salt Minion uudelleen
sudo systemctl restart salt-minion
