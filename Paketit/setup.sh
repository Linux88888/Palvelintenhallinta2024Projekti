download_and_run_script:
  cmd.run:
    - name: |
        wget -O /tmp/setup.sh https://github.com/Linux88888/Palvelintenhallinta2024Projekti/raw/main/Paketit/setup.sh
        chmod +x /tmp/setup.sh
        /tmp/setup.sh
    - require:
      - pkg: git
      - pkg: wget

install_git:
  pkg.installed:
    - name: git

install_wget:
  pkg.installed:
    - name: wget
