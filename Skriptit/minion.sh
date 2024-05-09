#!/bin/bash
# Päivitä pakettivarastot
sudo apt-get update
# Asenna Salt Minion
sudo apt-get install salt-minion -y

# Konfiguroi Salt Minion käyttämään t001 masterina
# Tarkista, onko master-asetus jo olemassa, ja päivitä se. Jos ei, lisää uusi rivi.
sudo sed -i '/^master:/c\master: 192.168.88.101' /etc/salt/minion || echo 'master: 192.168.88.101' | sudo tee -a /etc/salt/minion

# Käynnistä Salt Minion uudelleen
sudo systemctl restart salt-minion
