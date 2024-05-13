#!/bin/bash
# Päivitä paketit
sudo apt-get update
# Asenna Salt Master
sudo apt-get install salt-master -y

# Odotetaan, että Minionit lähettävät avaimensa
sleep 60  # Odotetaan 60 sekuntia, jotta minionit ehtivät käynnistyä ja lähettää avaimensa

# Hyväksy kaikki Minionien avaimet automaattisesti
sudo salt-key -A -y

# Testaa yhteys
sudo salt '*' cmd.run 'whoami'

# Luo hakemisto Salt-tilatiedostoille, jos sitä ei ole
sudo mkdir -p /srv/salt

# Lataa tilatiedosto GitHubista
sudo wget -O /srv/salt/webkehittäjäntyökalut.sls https://raw.githubusercontent.com/Linux88888/Palvelintenhallinta2024Projekti/main/Paketit/webkehitt%C3%A4j%C3%A4nty%C3%B6kalut.sls

# Aja Salt state Minionille t002
sudo salt 't002' state.apply webkehittäjäntyökalut
