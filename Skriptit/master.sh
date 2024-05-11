#!/bin/bash

# Päivitä paketit
sudo apt-get update
# Asenna Salt Master
sudo apt-get install salt-master -y

# Käynnistä Salt Master palvelu
sudo systemctl start salt-master
sudo systemctl enable salt-master

# Odotetaan, että Minionit lähettävät avaimensa
sleep 60  # Odotetaan 60 sekuntia, jotta minionit ehtivät käynnistyä ja lähettää avaimensa

# Hyväksy kaikki Minionien avaimet automaattisesti
sudo salt-key -A -y

# Lataa tarvittavat state-tiedostot GitHubista
sudo mkdir -p /srv/salt
cd /srv/salt
sudo wget https://github.com/Linux88888/Palvelintenhallinta2024Projekti/archive/refs/heads/main.zip
sudo unzip main.zip
sudo mv Palvelintenhallinta2024Projekti-main/* .
sudo rm -rf Palvelintenhallinta2024Projekti-main main.zip

# Testaa yhteys Minioneihin
sudo salt '*' cmd.run 'whoami'

# Aja esimerkiksi webkehittäjäntyökalujen asennus
sudo salt '*' state.apply Paketit/webkehittäjäntyökalut
