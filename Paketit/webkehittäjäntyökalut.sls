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


# Käynnistä Apache2 palvelu ja luo uusi sivu
apache2_service:
  service.running:
    - name: apache2
    - enable: true
    - watch:
      - pkg: install_dev_tools
      - file: veikkausliiga_com_page

# Uusi sivu
veikkausliiga_com_page:
  file.managed:
    - name: /var/www/html/veikkausliiga.html
    - source: salt://veikkausliiga.html
    - user: root
    - group: www-data
    - mode: 644
    - require:
      - pkg: apache2

# Pyydä Apache-palvelun status
get_apache_status:
  cmd.run:
    - name: systemctl status apache2
    - watch:
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
