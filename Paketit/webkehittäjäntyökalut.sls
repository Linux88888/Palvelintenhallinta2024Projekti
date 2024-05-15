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

# Varmista, että Apache2-paketti on asennettu
apache2_installed:
  pkg.installed:
    - name: apache2

# Käynnistä Apache2-palvelu ja asetetaan se käyttöön
apache2_service:
  service.running:
    - name: apache2
    - enable: true
    - require:
      - pkg: apache2_installed
    - watch:
      - file: veikkausliiga_com_page

# Luo uusi sivu
veikkausliiga_com_page:
  file.managed:
    - name: /var/www/html/veikkausliiga.html
    - source: salt://veikkausliiga.html
    - user: root
    - group: www-data
    - mode: 644
    - require:
      - service: apache2_service

# Pyydä Apache-palvelun status
get_apache_status:
  cmd.run:
    - name: systemctl status apache2
    - require:
      - service: apache2_service

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

    - enable: true
    - watch:
      - pkg: install_dev_tools
