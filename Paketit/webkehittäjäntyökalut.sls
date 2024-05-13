install_dev_tools:
  pkg.installed:
    - pkgs:
      - git
      - nodejs
      - npm
      - apache2
      - docker.io
      - postgresql
      - php
      - php-mysql
      - libapache2-mod-php

# Lisää tuki MySQL:lle, joka on vaihtoehtoinen tässä tapauksessa (korvaa tämä MySQL-paketin nimellä, joka on käytössä jakelussasi)
install_mysql:
  pkg.installed:
    - name: default-mysql-server  # Muista tarkistaa oikea paketin nimi!

# Käynnistä Apache2 palvelu
apache2_service:
  service.running:
    - name: apache2
    - enable: true
    - watch:
      - pkg: install_dev_tools

# Käynnistä Docker palvelu
docker_service:
  service.running:
    - name: docker
    - enable: true
    - watch:
      - pkg: install_dev_tools

# Käynnistä PostgreSQL palvelu
postgresql_service:
  service.running:
    - name: postgresql
    - enable: true
    - watch:
      - pkg: install_dev_tools
