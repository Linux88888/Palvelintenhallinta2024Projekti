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
