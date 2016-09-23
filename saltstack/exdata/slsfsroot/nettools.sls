install_network_packages:
  pkg.installed:
    - pkgs:
      - rsync
      - curl
      - tcpdump
